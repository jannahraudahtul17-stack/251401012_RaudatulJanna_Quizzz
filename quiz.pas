program TokoKelontong;
uses crt;

var
    harga_minyak: real;
    harga_beras: real;
    harga_gula: real; 
    harga_kecap: real; 
    harga_telur: real;
    jumlah_minyak: integer; 
    jumlah_beras: integer; 
    jumlah_gula: integer; 
    jumlah_kecap: integer; 
    jumlah_telur: integer;
    total_harga_sebelum: real; 
    total_harga_akhir: real;
    pajak: real; 
    potongan_pembelian_besar: real; 
    potongan_pembayaran: real;
    is_member: char;
    metode_pembayaran: integer;
    status_pelanggan: string;
    jenis_pembayaran: string;

begin
  clrscr;
  
  harga_minyak := 20000;
  harga_beras := 25000;
  harga_gula := 18000;
  harga_kecap := 15000;
  harga_telur := 3000;
  
  writeln('  Daftar Harga Barang  ');
  writeln('1. Minyak   = Rp 20.000');
  writeln('2. Beras    = Rp 25.000');
  writeln('3. Gula     = Rp 18.000');
  writeln('4. Kecap    = Rp 15.000');
  writeln('5. Telur    = Rp 3.000');
  writeln;
  
  writeln;
  writeln('Masukkan jumlah pembelian:');
  write('Jumlah Minyak  : '); 
  readln(jumlah_minyak);
  write('Jumlah Beras   : '); 
  readln(jumlah_beras);
  write('Jumlah Gula    : '); 
  readln(jumlah_gula);
  write('Jumlah Kecap   : '); 
  readln(jumlah_kecap);
  write('Jumlah Telur   : '); 
  readln(jumlah_telur);
  
  total_harga_sebelum := (harga_minyak * jumlah_minyak) + (harga_beras * jumlah_beras) + (harga_gula * jumlah_gula) + (harga_kecap * jumlah_kecap) + (harga_telur * jumlah_telur);
  
  writeln;
  write('Apakah pelanggan adalah member? (Y/T): '); 
  readln(is_member);
  if (upcase(is_member) = 'Y') then
  begin
    status_pelanggan := 'Member';
    pajak := 0; 
  end
  else
  begin
    status_pelanggan := 'Bukan Member';
    pajak := total_harga_sebelum * 0.10;
  end;
  
  potongan_pembelian_besar := 0;
  if (total_harga_sebelum > 200000) then
  begin
    potongan_pembelian_besar := 15000;
  end;
  
  writeln;
  writeln('Pilih metode pembayaran:');
  writeln('1. QRIS');
  writeln('2. Debit');
  writeln('3. Tunai');
  write('Masukkan pilihan (1-3): '); 
  readln(metode_pembayaran);
  
  case metode_pembayaran of
    1:
      begin
        potongan_pembayaran := 10000;
        jenis_pembayaran := 'QRIS';
      end;
    2:
      begin
        potongan_pembayaran := 15000;
        jenis_pembayaran := 'Debit';
      end;
    3:
      begin
        potongan_pembayaran := 5000;
        jenis_pembayaran := 'Tunai';
      end;
  end;
  
  total_harga_akhir := total_harga_sebelum - potongan_pembelian_besar - potongan_pembayaran + pajak;
  
  clrscr;
  writeln;
  writeln('           Ringkasan Belanja       ');
  writeln;
  
  writeln('1. Daftar Harga Barang');
  writeln('   Minyak    : Rp ', harga_minyak:0:0);
  writeln('   Beras     : Rp ', harga_beras:0:0);
  writeln('   Gula      : Rp ', harga_gula:0:0);
  writeln('   Kecap     : Rp ', harga_kecap:0:0);
  writeln('   Telur     : Rp ', harga_telur:0:0);
  writeln;
  
  writeln('2. Total Harga Sebelum Potongan & Pajak: Rp ', total_harga_sebelum:0:0);
  
  writeln('4. Status Pelanggan: ', status_pelanggan);
  if (upcase(is_member) <> 'Y') then
  begin
    writeln('   Pajak (10%) : +Rp ', pajak:0:0);
  end;
  
  if (total_harga_sebelum > 200000) then
  begin
    writeln('   Potongan Belanja (> Rp200.000) : -Rp ', potongan_pembelian_besar:0:0);
  end;
  
  writeln('5. Jenis Metode Pembayaran: ', jenis_pembayaran);
  writeln('   Potongan Metode Pembayaran : -Rp ', potongan_pembayaran:0:0);
  
  writeln;
  
  writeln('3. Total Harga Akhir: Rp ', total_harga_akhir:0:0);
  writeln;
  
  readln;
end.