# wikipedia_people_summary

Approach:

- spent a while identifying how best to extract data from the wiki pages
- identified it is not as straight forward as how i had previously communicated with APIs on my weather client; you do not have simple objects to call to get the result. Instead I need to extract the data from strings.
- I reviewed the data returned, and spotted common similarities, which included: '{{Infobox' refers to the information box on the side, this gives information related to birth, death and spouses
- birth date and age for living
- birth date for dead

- i learnt how inconsistent data is stored on wiki; after reviewing lots of pages; no consistency

stub api by saving data as local file
