
# **Welcome to our Ruby townhall email scrapper and mail sender**


## **Table of contents**

1.  [Team](#Team)
2.  [What can you do with this code?](#What_can_you_do_with_this_code?)
3.  [How to use](#How_to_use)
4.  [Files](#Files)



## **Team**

**[Charles Belpois](https://github.com/charles-mahaco)** >> *made the gmail API work and send emails*

**[François De Saporta](https://github.com/francois2sap/)** >> *project architecture and branches*

**[Marie-Charlotte Le Morvan](https://github.com/Spelmo)** >> *data scrapping (Json + google drive) + readme*

**Lionel Renard** >> *Twitter bot*

**Geoffroy Visquert** >> *Twitter bot*



## **What_can_you_do_with_this_code?**

This code allows you to **scrap the emails of the townhalls of several French administrations.**

You can choose to **store the emails** in a Json file or in a Google_spreadsheet that you can also download as a CSV file.

You can then **send an email to the whole database** using gmail.

You can **send a tweet to the administrations** to remind them of the email you sent.



## **How_to_use**

1.  `Git clone` our repository

2.  `Bundle install`our gems

3.  `Ruby app.rb` and follow instructions

***Careful!***

4.  In order to use google spreadsheet features, gmail features, twitter features and Json, you need to paste your own .env and config.json files into the repository.

5.  **In Json_scrapper.rb**, make sure you change the path to fit your own computer path.

6.  **In csv.rb**, make sure you change the path to fit your own computer path AND change the spreadsheet file name to your own.

7.  **In spreadsheet_scrapper.rb**, make sure you change the ID of the google spreadsheet to reflect the spreadsheet you want to copy your data into.

8.  **In mailer.rb**, make sure you change the path to fit your own computer path.



## **Files**

````    
Teamrepo
├── .gitignore
├── .env
├── README.md
├── Gemfile
├── Gemfile.lock
├── app.rb
├── db
│   ├── emails.json
│   └── emails.csv
└── lib
    ├── app
    │   ├── Scrapper.rb
    │   ├── spreadsheet_scrapper.rb
    │   ├── mailer.rb
    │   ├── CSV.rb
    │   │   ├── csv.rb
    │   │   └── config.json (put your own here)
    │   │
    │   └── Json_scrapper.rb
    │   │   ├── Json_scrapper.rb
    │   │   └── config.json (put your own here)
    │   │    
    └── views
        ├── done.rb
        └── index.rb

 ````

 app.rb = launcher

 db >> mails.json & emails.csv = databases of townhall emails

 lib >> app >> scrapper. rb = scraps townhall emails and put them in an hash

 lib >> app >> Spreadsheet_scrapper.rb = puts emails in a google sheet
 
 Lib >> app >> mailer.rb = sends emails to al townhalls

 lib >> app >> CSV >> CSV.rb = downloads google sheet into csv file

 lib >> app >> Jason_scrapper >> Json_scrapper.rb = puts scrapper.rb hash into a Json file
