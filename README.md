# Directory App

#### MTTN Hackathon

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

### Features we would love to add in the future:

1.  Add customised pages for the different FCs / Mess along with crowdsourced menus.
2.  Remove the participation of admin in the verification process and instead use a user-participated poll to check the validity of the number
3.  Chatbot via dialogflow with a touch of MTTN which would make using the app a more personalised experience.
