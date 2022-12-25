
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
.code
org 100h
start:
jmp mulai
nama		db 13,10,'Nama Lengkap  	: $'
kendaraan		db 13,10,'Jenis Kendaraan   : $'
	tampung_nama		db 30,?,30 dup(?)
	tampung_hp			db 13,?,13 dup(?)
	tampung_jenis		db 30,?,30 dup(?)
	Masukkan db 13,10,'Masukkan No/Kode yang anda pilih : $'
daftar db 13,10,'+=================================================+'
	db 13,10,'|				    Karcis Parkir       	     |'
	db 13,10,'|===+====================+========================|'
	db 13,10,'|No | Jenis Kendaraan    |        Harga/Jam       |'
	db 13,10,'|===|====================|========================|'
	db 13,10,'|01 | Kendaraan Roda 2   | Rp. 3.000              |'
	db 13,10,'|---|--------------------|------------------------|'
	db 13,10,'|02 | Kendaraan Roda 4   | Rp. 5.000              |'
	db 13,10,'|---|--------------------|------------------------|'
	db 13,10,'|03 | Kendaraan Berat    | Rp. 10.000             |'
	db 13,10,'+=================================================+$'
mulai:
		mov ah,09h
		lea dx,nama
		int 21h
		mov ah,0ah
		lea dx,tampung_nama
		int 21h
		push dx
	mov ah,09h
		lea dx,kendaraan
		int 21h
		mov ah,0ah
		lea dx,tampung_jenis
		int 21h
		push dx

		mov ah,09h
		mov dx,offset daftar
		int 21h
		mov ah,09h
		jmp proses

error_msg:
		mov ah,09h
		mov dx,offset error_msg
		int 21h
		int 20h

proses:
		mov ah,09h
		mov dx,offset Masukkan
		int 21h

		mov ah,01h
		int 21h
		mov bh,al
		mov ah,01h
		int 21h
		mov bl,al
	int 21h

	cmp bh,'0'
	cmp bl,'1'
		je hasil1

	cmp bh,'0'
	cmp bl,'2'
		je hasil2

	cmp bh,'0'
	cmp bl,'3'
		je hasil3

;--------------------------------------------

hasil1:
		mov ah,09h
		lea dx,teks1
		int 21h
		int 20h

hasil2:
		mov ah,09h
		lea dx,teks2
		int 21h
		int 20h
hasil3:
		mov ah,09h
		lea dx,teks3
		int 21h
		int 20h
;---------------------------------------------

teks1		db 13,10,' '                       
db 13,10,' +================================================+'
db 13,10,' |      Anda memilih Karcis Parkir Roda 2         | '
db 13,10,' +================================================+'
db 13,10,' Total Harga yang harus anda bayar adalah Rp. 3.000 '  
db 13,10,' '
db 13,10,' Catatan : '
db 13,10,' Karcis diambil saat masuk dan pembayaran dilakukan saat keluar'
db 13,10,' dengan menunjukan karcis parkir$'
                  

teks2		db 13,10,' '                       
db 13,10,' +================================================+'
db 13,10,' |      Anda memilih karcis parkir roda 4         | '
db 13,10,' +================================================+'
db 13,10,' Total Harga yang harus anda bayar adalah Rp. 5.000 '  
db 13,10,' '
db 13,10,' Catatan : '
db 13,10,' Karcis diambil saat masuk dan pembayaran dilakukan saat keluar'
db 13,10,' dengan menunjukan karcis parkir$'
               
teks3 	db 13,10,' '                       
db 13,10,' +================================================+'
db 13,10,' |   Anda memilih karcis parkir kendaraan berat   | '
db 13,10,' +================================================+'
db 13,10,' Total Harga yang harus anda bayar adalah Rp. 10.000 '  
db 13,10,' '
db 13,10,' Catatan : '
db 13,10,' Karcis diambil saat masuk dan pembayaran dilakukan saat keluar'
db 13,10,' dengan menunjukan karcis parkir$'
end start
	




