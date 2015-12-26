#!/usr/bin/env python
# encoding: utf-8

import jenkins
import sys
import os


def TriggerSendMail(list, cc, title_path, context_path):
    server = jenkins.Jenkins('http://10.75.8.176:8080/', username='hulingnan', password='ttcs')
    para = {}
    para["LIST"] = list

    if cc!="no":
        para["CC"] = cc

    para["TITLE"] = "there is no title"
    para["CONTEXT"] = "there is no context"

    if os.path.exists(title_path) and os.path.exists(context_path):
        title_file = open(title_path)
        context_file = open(context_path)
        para["TITLE"] = title_file.read()
        para["CONTEXT"] = context_file.read()
        os.remove(title_path)
        os.remove(context_path)

    server.build_job('Phabricator', para)

if __name__ == '__main__':
    TriggerSendMail(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])
