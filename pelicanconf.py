#!/usr/bin/env python
# -*- coding: utf-8 -*- #

AUTHOR = u'George Hickman'

DEFAULT_LANG = u'en'

DEFAULT_PAGINATION = False

DISPLAY_PAGES_ON_MENU = True

IMAGE_URL = '/theme/images/'

SITENAME = u'Penderry Farm'

TEMPLATE_PAGES = {
    'holiday_cottage.html': 'holiday_cottage.html',
    'things_to_do.html': 'things_to_do.html',
    'farm_and_habitats.html': 'farm_and_habitats.html',
    'art_projects.html': 'art_projects.html',
    'tina_lewis_paintings.html': 'tina_lewis_paintings.html',
    'contact.html': 'contact.html',
}

THEME = 'theme'

TIMEZONE = 'Europe/London'

names = [
    'Tina Lewis April 06',
    'Tina Lewis April 07 Beach And Boy',
    'Tina Lewis April 07 Field Of Sheep',
    'Tina Lewis April 08 1',
    'Tina Lewis April 08 2',
    'Tina Lewis April 08 3',
    'Tina Lewis April 13 1',
    'Tina Lewis April 13 2',
    'Tina Lewis April 13 3',
    'Tina Lewis April 13 4',
    'Tina Lewis April 13 5',
    'Tina Lewis April 13 6',
    'Tina Lewis April 13 7',
    'Tina Lewis April 13 8',
    'Tina Lewis April 13 9',
    'Tina Lewis Aug 06',
    'Tina Lewis Aug 12 1',
    'Tina Lewis Cherry Blossom Web',
    'Tina Lewis July 10',
    'Tina Lewis June 08 Paddling',
    'Tina Lewis June 12 1',
    'Tina Lewis June 12 2',
    'Tina Lewis June 12 3',
    'Tina Lewis June 12 4',
    'Tina Lewis Oct 07 1',
    'Tina Lewis Oct 07 2',
    'Tina Lewis Oct 11. 2Jpeg',
    'Tina Lewis Oct 11 1',
    'Tina Lewis Oct 11 3',
    'Tina Lewis Opium Poppies',
]
PAINTINGS = [{'alt': x, 'name': x.lower().replace(' ', '_')} for x in names]
