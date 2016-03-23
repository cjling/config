#!/usr/bin/env python
# encoding: utf-8

from anydo_api.client import Client
from anydo_api.task import Task
from datetime import datetime


def get_today_title():
    now_date = datetime.today()
    return "%d/%d/%d" %(now_date.year, now_date.month, now_date.day)


def save_log(user, tasks):
    log = ""
    index = 1
    gap = ".\n.\n"

    for task in tasks:
        if task['status'] == "CHECKED":
            continue
        log += "%d.%s\n" %(index, task['title'])
        index += 1
        if len(task.notes()) != 0:
            log += "--Note:\n"
            for note in task.notes():
                log += "%s\n" %note

        subtask_list = [subtask for subtask in task['subTasks'] if subtask['status'] != "CHECKED"]
        if len(subtask_list) != 0:
            log += "--Subtasks:\n"
            sub_index = 1
            for sub in subtask_list:
                log += "%d)%s\n" %(sub_index, sub['title'])
                sub_index += 1
        log += gap

    if log[-4:] == gap:
        log = log[:-4]

    log_task = Task.create(user=user, title=get_today_title(), priority="Normal", repeatingMethod='TASK_REPEAT_OFF')
    log_task.add_note(log)
    print "save log sucessfully!"


def is_doing(due_date):
    now_date = datetime.today()
    if due_date.year < now_date.year:
        return True
    elif due_date.year > now_date.year:
        return False

    if due_date.month < now_date.month:
        return True
    elif due_date.month > now_date.month:
        return False

    if due_date.day <= now_date.day:
        return True
    else:
        return False


def start():
    user = Client(email='cjling@aliyun.com', password='916sa...').get_user()
    cate = [cate for cate in user.categories() if cate['name'] == u"工作"]

    if len(cate) != 1:
        return

    works = cate[0].tasks()
    tasks = []
    for work in works:
        if work['dueDate'] is None:
            continue
        due_date = datetime.fromtimestamp(work['dueDate'] / 1000)
        if is_doing(due_date):
            tasks.append(work)

    save_log(user, tasks)


if __name__ == '__main__':
    start()
