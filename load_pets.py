#!/usr/bin/env python
# -*- Coding: Utf-8 -*-

"""
Week 10 Assignment Part II
"""

import sqlite3 as db
import sys

dbcon = None

try:
    dbcon = db.connect('pets.db')
    dbcon.row_factory = db.Row
    dbcur = dbcon.cursor()
    pid = raw_input('Enter a person\'s ID: ')
    while int(pid) != -1:

        rcnt = 'select COUNT(*) from person'

        psql = 'select first_name as first, ' \
               'last_name as last, ' \
               'age from person where id = ' + pid

        asql = 'select a.name, ' \
               'a.breed,' \
               'a.age,' \
               'a.dead from person_pet as pp ' \
               'left join pet as a on pp.pet_id = a.id where pp.person_id = ' + pid

        if dbcur.execute(psql):
            prows = dbcur.fetchall()
            if len(prows) == 0:
                print 'Id {} not found.'.format(pid)
                dbcur.execute(rcnt)
                cnt = dbcur.fetchone()
                print 'Try Id 1 to {}.'.format(cnt[0])
            for prow in prows:
                first, last, age = prow['first'], prow['last'], prow['age']
                print '{} {}, {} years old.'.format(first, last, age)
                if dbcur.execute(asql):
                    arows = dbcur.fetchall()
                    if len(arows) == 0:
                        print '{} {} has no pet.'.format(first, last)
                    for arow in arows:
                        name, breed, years, dead = \
                            arow['name'], arow['breed'], \
                            arow['age'], arow['dead']
                        if int(dead) == 0:
                            print '{} {} owns {}, a {} ' \
                                  'that is {} years old.'.format(first,
                                                                 last,
                                                                 name,
                                                                 breed,
                                                                 years)
                        elif int(dead) == 1:
                            print '{} {} owned {}, a {} ' \
                                  'that was {} years old.'.format(first,
                                                                  last,
                                                                  name,
                                                                  breed,
                                                                  years)

        pid = raw_input('Enter a person\s ID: ')
    raise db.Error('Ending program')

except db.Error, err:
    print 'Message: {}'.format(err.args[0])
    sys.exit(1)

finally:
    if dbcon:
        dbcon.close()
