#!/usr/bin/env python
# encoding: utf-8

from anydo_api.client import Client
from datetime import datetime
import time
import os
import chardet
from anydo_api.task import Task
from geeknote.geeknote import Notes
import logging
from logging.handlers import RotatingFileHandler


LOG = logging.getLogger("joblogger")
LOG.setLevel(logging.DEBUG)
formatter = logging.Formatter('%(asctime)s %(filename)s[%(lineno)d] %(levelname)s: %(message)s')

rfh = RotatingFileHandler('/var/log/job.log', maxBytes=5*1024*1024,backupCount=5)
rfh.setLevel(logging.DEBUG)
rfh.setFormatter(formatter)

fh = logging.FileHandler("/var/log/job.log")
fh.setLevel(logging.DEBUG)
fh.setFormatter(formatter)

# LOG.addHandler(fh)
LOG.addHandler(rfh)


def get_today_title():
    now_date = datetime.today()
    return "%d/%d/%d" %(now_date.year, now_date.month, now_date.day)


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


def get_log(tasks):
    log = ""
    index = 1
    gap = "\n\n"

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

    if log[-2:] == gap:
        log = log[:-2]
    return log


def get_user():
    passwd=os.popen("anydo_passwd").read()
    user = Client(email='cjling@aliyun.com', password=passwd).get_user()
    return user


def get_tasks(user):
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
    return tasks


def save_log(log):
    LOG.info("bgn save log on yinxiang")
    Notes().create(title=get_today_title(), content=log, notebook="98_工志")


def start():
    user = get_user()
    tasks = get_tasks(user)
    log = get_log(tasks)
    log = log.encode('utf-8')
    LOG.info("get log from anydo sucessfully!")
    save_log(log)
    LOG.info("save log sucessfully!")


def start_wrapper():
    try:
        start()
        return True
    except Exception, e:
        LOG.info("something wrong happened try ag after 30 second:")
        LOG.info(e)
        time.sleep(30)
        return False


if __name__ == '__main__':
    LOG.info("start save log")
    flag = False
    while not flag:
        flag = start_wrapper()
