# Mail Mill
**IMPORTANT: Do not delete the etc, .git, Staging, or Converted directories inside this folder!**

## About

This project allows Hagley staff to easily convert their Outlook messages into more open formats (EML and PDF) and preserve attachments. Possible use cases include the preservation of email threads concerning collection donations, chain of custody, case file documents, etc.

## Usage

*Note: Do not use for messages containing PII or sensative financial info.*

From Outlook or your email client, simply forward the e-mail you wish to convert to HL.SaveMail@gmail.com. Once received, it may take 5-10 minutes before the message is downloaded to the shared drive and converted. You will find the files in the Converted directory. If your email had attachments, they will be saved in a corresponding sidecar folder. This folder will be created regardless of whether or not your message contained attachments.

Once the files are in place you should copy them elsewhere for safekeeping. If you moved or deleted files from the Converted directory you may notice them reappear shortly after. Messages are routinely synced throughout the day. After 24 hours the message will be deleted from the inbox and no longer downloaded to the shared drive.

### Package Specification

* File names exceeding 100 characters will be shortened.

|--Converted
   |--{Date-downloaded}_{Email-Subject}_{Sender}.eml
   |--{Date-downloaded}_{Email-Subject}_{Sender}.eml.pdf
   |--{Date-downloaded}_{Email_Subject}_{Sender}.eml-attachments
      |--{Original attachments filenames}

### EML

EML, see[Electionic Mail Format](https://www.loc.gov/preservation/digital/formats/fdd/fdd000388.shtml), is a RFC 5322 compliant file extension used by a number of email clients. Files are stored as plaintext with attachments embedded as base-64 MIME content. 


*Mail Mill v1 -- Mike Demers 2020-01-24*