# Configuration Syntax
The configuration file is read line by line to determine how the document should be layed out.
This file has a fairly simple syntax:
## Combining/Creating New PDFs
A New PDF is created by combining PDFs together.
To do this the name of the new PDF is written on a line and all the PDFs that are part of it are written on subsequent lines but tabbed in by 1. (**Note:** The format of this document is space independant, in other words, tab MUST be used to indent for the purpose of creating new PDFs. However, spaces can be used to make the config file more readable if need be.) 

```matlab
new_pdf_name
	sub_pdf_1
	sub_pdf_2
	⋮
	sub_pdf_n
```

This can continue for multiple levels *i.e.* having nested PDFs.

```matlab
new_pdf_name_1
	sub_pdf_1_1
	new_pdf_name_2
		sub_pdf_2_1
		sub_pdf_2_2
		⋮
		sub_pdf_2_n
	sub_pdf_1_2
```

## Comments
Any line can have a comment noted by the symbol `%`.
Comments can exhist anywhere in the line and function similar to comments in other programming languages (anything after the comment is ignored, up to the end of the line).
Comments can be used to add descriptions or other comments in line with the PDFs:

```matlab
new_pdf_name_1 % This is the main PDF
	sub_pdf_1_1 % This is a PDF to be added
	new_pdf_name_2 % This is a sub document that needs to be created.
		sub_pdf_2_1
		sub_pdf_2_2
		⋮
		sub_pdf_2_n
	sub_pdf_1_2
```

Additionally comments can be used to exclude PDFs:

```matlab
new_pdf_name_1 % This is the main PDF
	sub_pdf_1_1 % This is a PDF to be added
	new_pdf_name_2 % This is a sub document that needs to be created.
		sub_pdf_2_1
%		sub_pdf_2_2 % This PDF is no longer included in any of the documents
		⋮
		sub_pdf_2_n
	sub_pdf_1_2
```