## KioskContacts
rand@randix.net

### Introduction

Kiosk Contacts is a self-service kiosk for event contact data collection. It can be run in the iOS "kiosk" mode (Guided Access) on an iPad or an iPhone.
To use, the booth host invites a visitor to enter contact information to share for the purpose of the visitor getting further information. Kiosk Contacts can be configured to send a mail or message immediately to the visitor.
The app saves collected information to a file and initiates the sending of a welcome mail to the mail address or text message telephone number entered on the form.

### Requirements

The OS requirement is iOS or iPadOS 14.0 or greater.
A better user experience will be had using and iPad. This document assumes that an iPad is used. Kiosk Contacts will run on an iPhone as well.

### Access to Data

Kiosk Contacts presents a simple, configurable contact information form. The visitor enters his or her contact information and taps Submit. Kiosk Contacts parses the form data and initiates a mail or message, based on the form data, if so configured. The data is saved and the form is then cleared, ready for the next visitor.
Kiosk Contacts stores the contact form data inside the app. Use iOS Files to access this data directly or to share it with another computer. Open Files and navigate to On My iPad. Tap on the folder Kiosk Contacts. This folder is only present after Kiosk Contacts has been started at least once. Tap and hold on a file for a pop-up menu of actions, among which are Quick Look and Share. Use Share to share a file with, for example, Mail. As desired, share the file contacts.csv to another computer for processing.

### Kiosk Contacts Files

These files are described in detail below.
1024 (.png)
contacts (.csv)
mail (.txt)
message (.txt)
settings (.txt)
Setup (.pdf)
VM Logo Color Thrive Tag (.jpg)

The files contain either configuration information, i.e. settings.txt, or text and fields for the subject and body of the mail message, mail.txt, or of the iMessage message, message.txt. The fields will be replaced by either configuration information or by fields from the form data when a mail or a message is sent. This is described below in the Substitions in Mail and Messages section.

Setup.pdf - documents the setup of Kiosk Contacts.

contacts.csv - contains the saved contact data. Open with Numbers or share this file to another computer. Process it using a spreadsheet application such as Google Docs, MS Excel, or Numbers.

mail.txt - contains the "from:" and "subject:" fields and the body of a mail message to be sent to the contact when Submit is tapped. This file may be edited and fields entered to be replaced by text from the contact form.

The "from:" address must be in the list of possible sender addresses on the device to be used, otherwise Mail will use a From: address present on the device.

The "subject:" is the subject field of the mail message.

The "---" must be left in place as a separator line.

message.txt - contains the body of an iMessage to be sent to the contact when Submit is tapped, if so configured. This file may be edited and fields entered to be replaced by text from the contact form.

1024.png - the default image file used as a logo icon in Kiosk Contacts. Add most any image file, i.e. JPEG or PNG file, to be used as your own icon or logo.

VM Logo Color Thrive Tag.jpg -  another sample image file. 

Images with transparent backgrounds will probably not display well in Dark Mode. Set Light Mode in iOS Settings → Display & Brightness, turn off Automatic and select Light.

settings.txt - contains the settings. Edit this with any text editor or inside Kiosk Contacts.  Or share this file with a computer via mail and edit the file, then send it back, and from Mail, save it to Files → On My iPad → Kiosk Contacts.

These settings may be edited "in app". Tap on the icon/logo image four times and a view will be opened in which the configuration files may be edited. Enter the pin which is set in settings.txt.

The settings here should be changed appropriately:

pin=**** This is the pin to be used to edit the files inside the *Kiosk Contacts* app.

kiosktitle=Conference East Sets the title of the app.

subtitle=VM Kiosk Sets the subtitle of the app.

event=conference Used in substitutions.

image=VM Logo Color Thrive Tag.jpg Logo.

mailsend=1 Set to 0 or 1. If 1, then a mail is sent.

messagesend=0 Set to 0 or 1. If 1, then an iMessage is sent.  If both mailsend and messagesend are set, then a mail message will be preferred. If both are set, and only one of the fields in the form are filled out, then that is preferred.

title=1 Set to 1 to collect a title, such as "Mr.", "Mrs.", "Dr.", etc.

middlename=0 Set to 1 to collect the middle initial.

middleinitial=0 Set to 1 to collect the middle name.

suffix=1 Set to 1 to collect a name suffix, such as "Jr.", "III", etc.

addressline2=0 Set to 1 to display and collect the second line of an address.

country=0 Set to 1 to collect the state.

organization=0 Set to 1 to collect an organization.

note=1 Set to 1 to collect a note.

mailaddress=1 Set to 1 to collect a mail address.

phone=1 Set to 1 to collect a phone number.

Substitutions in Mail and Messages

These fields may be included in the mail and/or message files and will be substituted with data from the settings or the forms.

Settings

kiosktitle
subtitle
event

Contact Form Data

title
firstname
middlename
middleinitial
lastname
suffix
addressline1
addressline2
city
state
zipcode
country
organization
note
mailaddress
phone

### Editing the Configuration Files

The files are to be edited to configure the form field settings and the contents of the messages to be sent for a particular event.

### Kiosk Contacts Editor

Kiosk Contacts has a built-in editor for its files. This is hidden from the normal user.  There are two controls to hide this:

1) Tap on the logo/icon image four times to enter the pop-up editor view.
2) You must enter the pin (recommended 4 or 5 digits), which is in the settings.txt file, to be allowed to edit.

You will then see an editor view where you can select which file to edit, edit the file, and cancel or save the file.

You may also share the files to a computer, edit them there, and then copy back, with the assistance of Files and, for example, Mail. Mail the files to yourself on your computer, edit them as desired, then mail them back to the iOS device, and save them from Mail back to the Kiosk Contacts folder.

### Kiosk Mode / Guided Access

iOS supports a kiosk mode, allowing access only to a single application.  You may use this to lock access to Kiosk Contacts.
On iOS 15-17, this is activated under:
Settings → Accessibility → Guided Access
There you may switch Guided Access to on and set up the Passcode Settings. Read the instructions there on how to start and stop it.

Font Size
iOS supports changing the default text font size.

This is activated under:
Settings → Accessibility → Display & Text Size → Larger Text

There you may switch Larger Accessibility Sizes to on and then adjust the size of the text with the slider bar below. Try several positions on the slider bar with viewing the Kiosk Contacts app and decide on the best size.

### Privacy

Kiosk Contacts collects contact information and stores it in a file inside the app. That information is given voluntarily, normally a person enters his or her own information into the app, with the intention of providing the information to the event booth host. This app does not use the information in any way other than simply to collect it and store it in the app.

### Support and Information

Please contact Rand for improvement suggestions or help.

© 2021-2023 Randix LLC
