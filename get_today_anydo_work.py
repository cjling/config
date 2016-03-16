#!/usr/bin/env python
# encoding: utf-8

from anydo_api.client import Client
from anydo_api.task import Task
from datetime import datetime
import sys


def get_today_title():
    now_date = datetime.today()
    return "%d/%d/%d" %(now_date.year, now_date.month, now_date.day)


def save_log(user, tasks):
    log = ""
    for task in tasks:
        if task['status'] == "CHECKED":
            continue

        log += "%s\n" %task['title']

        if len(task.notes()) != 0:
            log += "note:\n"
            for note in task.notes():
                log += "%s\n" %note

        subtask_list = [subtask for subtask in task['subTasks'] if subtask['status'] != "CHECKED"]
        if len(subtask_list) != 0:
            log += "subtasks:\n"
            for sub in subtask_list:
                log += "%s\n" %sub['title']

        log += "\n"

    log_task = Task.create(user=user, title=get_today_title(), priority="Normal", repeatingMethod='TASK_REPEAT_OFF')
    log_task.add_note(log)


def print_task(task):
    if task['status'] == "CHECKED":
        return

    print "task title:" + task['title']

    if len(task.notes()) != 0:
        print "task note:"
        for note in task.notes():
            print note

    subtask_list = [subtask for subtask in task['subTasks'] if subtask['status'] != "CHECKED"]
    if len(subtask_list) != 0:
        print "subtasks:"
        for subtask in subtask_list:
            print subtask['title']

    print
    print


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


if __name__ == '__main__':
    user = Client(email='cjling@aliyun.com', password='916sa...').get_user()

    cate = [cate for cate in user.categories() if cate['name'] == u"工作"]

    if len(cate) != 1:
        sys.exit(0)

    works = cate[0].tasks()
    now_date = datetime.today()
    # print "++++++++++++++++++++++++++++++++++++++++++++" + str(now_date.year) + "/" + str(now_date.month) + "/" + str(now_date.day) + "++++++++++++++++++++++++++++++++++++++++++++++++++"
    tasks = []
    for work in works:
        if work['dueDate'] is None:
            continue
        due_date = datetime.fromtimestamp(work['dueDate'] / 1000)
        if is_doing(due_date):
            tasks.append(work)
            # print_task(work)

    save_log(user, tasks)
