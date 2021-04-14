# Directory App

#### MTTN Hackathon

### Team:
1. Divyansh Kulshreshtha [(@divyanshkul)](https://www.github.com/divyanshkul)
2. S. Sitaraman [(@hackerbone)](https://www.github.com/hackerbone)

## Problem Statement:

Every other day, we find ourselves stressfully scurrying for contact details for a service we need urgently—be it the constantly-busy line of a certain mess, cab services, repair shops for quick laptop fixes, or more. And, what's this? In this scenario, the MTTN app doesn't have a Directory tab on hand to help you out either.

## Solution:

Our vision was to create a platform which would cater to the everyday needs of a manipalite. Our app provides much more information than other directory apps as, to a everyday user it is :

1.  User friendly
2.  Easy to navigate and use

The app provides a curated list of important services with their contact information that exist around the town. We have also included a map through which the user can easily navigate to their desired location.

This could be tackled by creating a cross-platform mobile application which would make user experience seamless so we went on with using [Flutter](https://flutter.dev/) as our main stack.
With the database being handled by [Firebase](https://firebase.google.com/)

### Solution to the additional problem:

Often times, we see a number getting outdated without anyone's knowledge, to tackle this problem, we have implemented an **upvote** feature and a **report and update** feature.
We are crowdsourcing the validity of the numbers by:

1. Users can "report" a number and if a number has been reported more than two times, then the current number is displayed with a warning (red colour)

2. Along with reporting, if the user also has an alternate working number for the service, he/she can add that number in the app, this number then gets stored in our database.

3. To avoid fake numbers being updated, currently, the admin will have to verify the numbers

<br>
<br>

### Steps to install:
1. ```flutter build apk --build-name=1.0.1 --build-number=1```
2. Run via AVD on Android Studio
3. Download [**apk**](https://drive.google.com/file/d/1e9Rfc-K96YrLRCr9EZAt645ZwZY2Uqzh/view?usp=sharing)

<br>
<br>


### Features we would love to add in the future:

1.  Add customised pages for the different FCs / Mess along with crowdsourced menus.
2.  Remove the participation of admin in the verification process and instead use a user-participated poll to check the validity of the number
3.  Chatbot via dialogflow with a touch of MTTN which would make using the app a more personalised experience.



<br>
<br>
<br>

## Snapshots:

![shotsnapp-1618429269 704](https://user-images.githubusercontent.com/34028379/114770533-2dd5d180-9d89-11eb-89cd-acc959f56b5b.png)
![shotsnapp-1618429308 578](https://user-images.githubusercontent.com/34028379/114770540-30382b80-9d89-11eb-8dee-d7ad22f5776e.png)
![shotsnapp-1618429344 913](https://user-images.githubusercontent.com/34028379/114770548-3201ef00-9d89-11eb-923f-32092b98ce71.png)
![shotsnapp-1618429699 025](https://user-images.githubusercontent.com/34028379/114770556-34fcdf80-9d89-11eb-95e4-957a8aa748bb.png)
![shotsnapp-1618429720 954](https://user-images.githubusercontent.com/34028379/114770866-902ed200-9d89-11eb-8aa8-bccaa614c665.png)
