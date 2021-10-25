## Kiosk Contacts
This app presents a configurable screen form to enter contract information.

The information is saved to a file, and a welcome mail is sent to email address entered on the form.

### Requirements
The minimum OS is:

 - iOS or iPadOS 15.0 or greater

### Access to Data

This app presents a simple, configurable form, and when the **Submit** button is tapped, saves the information in the form (with no validation) to a file in the App's documents directory. The data is save to a CSV, comma separated values, file. This file can be opened with most modern spreadsheet applications, i.e. MS Excel or Apple Numbers, and processed further.

To find the documents for *Kiosk Contacts*, use the *Files* app. Open the *Files* app, then navigate to *On My iPad* on an iPad or *On My iPhone* on an iPhone. There will be a folder for *Kiosk Contacts*. Tap on Kiosk Contacts and you should see a display of the files there. (This is only after the app has be started at least once.)

There will be the following files:

- contacts (.csv)
- message (.txt)
- sender (.txt)
- settings (.txt)
- subject (.txt)
- VM Logo Color Thrive Tag (.jpg)
- README (.pdf)
- README (.md)

#### Files App

The *File* app can be used to examine or share a file. Tap and hold on a file for a pop-up menu of actions, among which are *Quick Look* and *Share*.

### Kiosk Contacts Files

The files contain either configuration information (*settings.txt*) or text and fields. The fields will be replaced by either configuration information or by fields from the form data.

The files in *Kiosk Contacts* are:

#### contacts 

This file is contacts.csv and contains the saved contacts from tapping the **Submit** button. This file can be directly opened in Numbers, or can be shared to be opened and processed on another device.

#### mail

This file contains the body of a mail message to be sent to the contact when **Submit** is tapped. This file may be edited and certain fields entered to be replaced by text from the contact form.

#### message

This file contains the body of an iMessage to be sent to the contact when **Submit** is tapped. This file may be edited and certain fields entered to be replaced by text from the contact form.

#### sender

This file may contains a field, which can be used:

- sendermail - this the email address to be used in the From: field of the mail. The email address must be in the list of possible sender addresses on the device.

#### subject

This file contains the subject of the mail message to be send to the contact when **Submit** is tapped. This file may be edited and certain fields entered to be replaced by text from the contact form.

#### VM Logo Color Thrive Tag

This is a sample image file to be used as a logo icon in the *Kiosk Contacts* app.

#### settings

This file contains the settings for the app. These are here rather than in the app to make it difficult for a person entering contact information to change the settings during and event.

The settings here are (and their defaults, these should be changed appropriately):

- title=Conference East

  Sets the title of the App.

- subtitle=VM Kiosk

  Sets the subtitle of the App.

- event=conference

  Used in substations.

- image=VM Logo Color Thrive Tag.jpg

  Demo logo.

- enablemailsend=1

  Set to 0 or 1. If 1, then a mail is sent.

- enablemessagesend=0

  Set to 0 or 1. If 1, then an iMessage is sent.

- personaltitle=1

  Set to 1 to collect a personal title, such as "Mr.", "Mrs.", etc.

- firstname=1

  Set to 1 to collect the first name.

- middlename=0

  Set to 1 to collect the middle initial.

- middleinitial=0

  Set to 1 to collect the middle name.

- lastname=1

  Set to 1 to collect the last name.

- suffix=0

  Set to 1 to collect a name suffix, such as "Jr.", "III", etc.

- addressline1=1

  Set to 1 to collect the first line of an address.

- addressline2=1

  Set to 1 to collect the second line of an address.

- city=1

  Set to 1 to collect the address city.

- state=1

  Set to 1 to collect the address state.

- zipcode=1

  Set to 1 to collect the zip code or postal code.

- country=0

  Set to 1 to collect the state.

- organization=0

  Set to 1 to collect an organization.

- mailaddress=1

  Set to 1 to collect an email address.

- phone=1

  Set to 1 to collect the phone number.

### Substitions

These fields may be included in the mail, message, and subject files and will be substituted with data from the settings or the forms.

##### Settings

- title
- subtitle
- event
- image - this will be resized to a signature size.

##### Contact Form Data

- personaltitle
- firstname
- middlename
- middleinitial
- lastname
- suffix



- addressline1
- addressline2
- city
- state
- zipcode
- country



- organization



- mailaddress
- phone



#### Support and Information

Please contact Rand:  rand@randix.net

