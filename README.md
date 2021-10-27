## Kiosk Contacts
This app presents a configurable screen form to enter contact information.

The information is saved to a file, and a welcome mail (or message) is sent to the mail address entered on the form.

### Requirements
The minimum OS is:

 - iOS or iPadOS 15.0 or greater

### Access to Data

This app presents a simple, configurable form, when the **Submit** button is tapped, saves the information in the form (with no validation) to a file in the app's documents directory. The data is saved to a CSV, comma separated values, file, *contacts.csv*. This file can be opened with most modern spreadsheet applications, i.e. MS Excel or Apple Numbers, and processed further.

To find the documents for *Kiosk Contacts*, use the Apple *Files* app. Open the *Files* app, then navigate to *On My iPad* on an iPad or *On My iPhone* on an iPhone. There will be a folder for *Kiosk Contacts*. Tap on *Kiosk Contacts* and you should see a display of the files there. (You will only see the files after the app has been started at least once.)

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

The *File*s app can be used to examine or share a file. Tap and hold on a file for a pop-up menu of actions, among which are *Quick Look* and *Share*. Use *Share* to share a file with, for example, *Mail*.

### Kiosk Contacts Files

The files contain either configuration information (*settings.txt*) or text and fields for the subject and body of the mail message or of the iMessage message. The fields will be replaced by either configuration information or by fields from the form data.

The files in *Kiosk Contacts* folder are:

#### README

This is this document which describes and informs the usage of *Kiosk Contacts*. This file is there in both text ".md" and ".pdf" formats. You are reading this file.

#### contacts

This file (*contacts.csv*) contains the saved contacts from tapping the **Submit** button. This file can be directly opened in Numbers, or can be shared to be opened and processed on another device, where it might be processed with, for example, MS Excel or Apple Numbers.

#### mail

This file (*mail.txt*) contains the body of a mail message to be sent to the contact when **Submit** is tapped. This file may be edited and certain fields entered to be replaced by text from the contact form.

#### message

This file (*message.txt*) contains the body of an iMessage to be sent to the contact when **Submit** is tapped, if so configured. This file may be edited and certain fields entered to be replaced by text from the contact form.

#### sender

This file (*sender.txt*) may contains the sendermail mail address, which is used as the mail address in the From: field of the mail. The mail address must be in the list of possible sender addresses on the device to be used, otherwise Mail will use a From: address present on the device.

#### subject

This file (*subject.txt*) contains the subject of the mail message to be sent to the contact when **Submit** is tapped. This file may be edited and fields entered to be replaced by text from the contact form.

#### VM Logo Color Thrive Tag

This is a sample image file (*VM Logo Color Thrive Tag.jpg*) to be used as a logo icon in the *Kiosk Contacts* app. This file may be replaced with any JPEG or PNG file.

#### settings

This file (*settings.txt*) contains the settings for the app. These are here rather than in the app itself in order to make it difficult for a person entering contact information to change the settings during and event.

The settings here (and their defaults, these should be changed appropriately) are:

- title=Conference East

  Sets the title of the app.

- subtitle=VM Kiosk

  Sets the subtitle of the app.

- event=conference

  Used in substations.

- image=VM Logo Color Thrive Tag.jpg

  Logo.



- enablemailsend=1

  Set to 0 or 1. If 1, then a mail is sent.

- enablemessagesend=0

  Set to 0 or 1. If 1, then an iMessage is sent.

  Only one of enablemailsend or enablemessagesend should be set to 1. If both are set, then a mail message will be preferred. If both are set, and only one of the fields in the form are filled out, then that is preferred.



- personaltitle=1

  Set to 1 to collect a personal title, such as "Mr.", "Mrs.", etc.

- middlename=0

  Set to 1 to collect the middle initial.

- middleinitial=0

  Set to 1 to collect the middle name.

- suffix=1

  Set to 1 to collect a name suffix, such as "Jr.", "III", etc.



- addressline2=0

  Set to 1 to display and collect the second line of an address.

- country=0

  Set to 1 to collect the state.

- organization=0

  Set to 1 to collect an organization.



- mailaddress=1

  Set to 1 to collect an mail address.

- phone=1

  Set to 1 to collect the phone number.

#### Substitions

These fields may be included in the mail, message, and subject files and will be substituted with data from the settings or the forms.

##### Settings

- title
- subtitle
- event

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

#### Editing the Configuration Files

The files are intended to be edited to configure the form field settings and the contents of the messages to be sent for a particular event.

Unfortunately, iOS does not include a text file editor natively from Apple on the platform. Therefore, to edit a text file directly on the iPhone or the iPad, you must download a third-party app from the Apple AppStore.

There are many of such apps in the Apple AppStore, search for "text editor" and choose one.

You can also copy the files to a computer, edit them there, and then copy back, with the assistance of the Files App and, for example, Mail.  Mail the files to yourself on your computer, edit them as desired, then mail them back to the iOS device, and save them from Mail back to the *Kiosk Contacts* folder.

### Support and Information

Please contact  rand@randix.net or see http://www.randix.net/KioskContacts/support.html .

See the document at http://www.randix.net/KioskContacts/privacy.html for information regarding the privacy aspects of the *Kiosk Contacts* app.

