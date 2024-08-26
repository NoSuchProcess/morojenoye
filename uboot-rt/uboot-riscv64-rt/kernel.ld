ENTRY(_start)

SECTIONS
{
	.text : {
		*(.text._start)
	} > RAM
}
