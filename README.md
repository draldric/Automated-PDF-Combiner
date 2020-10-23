# Automated-PDF-Combiner
The purpose of this software is to provide an easy method to conbine multiple PDF together.

## History
The creation of this program arose from a need to order and combine hundreds of pdfs together in a specified order.
While using many free PDF combiners, it is noticed that most lack a key feature... the ability to save the order of the documents being combined.

This might seem superficial at first, however, imagine the case of combining even a small number of documents ( *i.e.* 20) this might take 10-15 minutes.
Additionally, if you need to make sub-documents this can take even longer.
Finally, if you are required to update all the packages because a single or more pdfs change this can work up to hours of time.

I found myself in just this situation, lucky for me I was in a superviory roll, I didn't need to do the work myself. 
However, this took the person this was delgated to away from their other tasks.
And we were dealing with 100+ pdfs, and the main document and all of the sub-documents needed weekly updating.
While word documents or excel spreadsheets can make keeping track of the sub-documents and the orders of the files easier, it does not cut down one the time required to make the document.

## Setup
  1. Install GNU Octave/MATLAB
  2. Install PDFtk-Free/PDFtk-Server

## Use
The program utilizes an auxilary (configuration) file to specify the the ordering and sub-documents to create.
This configuration file can exhist anywhere and does not have to be in the same directory as the pdf to be combined.
To see the specifics about the format of the configuration file see [Config Syntax](doc/config_syntax.md)

## Third Party Software
### GNU Octave/MATLAB (Required)
The provided program is a script that has been written in an [GNU Octave](https://www.gnu.org/software/octave/)/[MATLAB](https://www.mathworks.com) compatable format.
The program only requires the base installation of of either software to run.
### PDFtk (Required)
The provided program is able to combine pdfs via a command line utility, [PDFtk-Server](https://www.pdflabs.com/tools/pdftk-server/)/[PDFtk-Free](https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/).
These tools are used under the GPL license, however, are left for the end user to download and install.
### Notepad++ (Optional)
While the config file can be edited in any text editor, the recommend (on used by me) is [notepad++](https://notepad-plus-plus.org/).
Additionally, I have provided a syntax highlighting profile for the config file to make the reading significantly easier.
