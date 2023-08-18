%ΑΝΔΡΕΑΣ ΚΑΛΑΒΑΣ 03119709
%1.1:
%α)το b2 είναι για P=2, το b5 είναι για P=5, το α είναι κοινό
a=[1];
b2=[0.55,0,0.45];
b5=[0.55,0,0,0,0,0.45];
%β)
freqz(b2,a);
grid on;
title("Frequency Response of Echo Filter (P=2)");
figure(2);
freqz(b5,a);
grid on;
title("Frequency Response of Echo Filter (P=5)");
%γ)
figure(3);
zplane(b2,a);
grid on;
title("Zero-Pole Diagramm of Echo Filter (P=2)");
figure(4);
zplane(b5,a);
grid on;
title("Zero-Pole Diagramm of Echo Filter (P=5)");
%δ)
figure(5);
impz(b2,a);
grid on;
title("Impulse Response of Echo Filter (P=2)");
figure(6);
impz(b5,a);
grid on;
title("Impulse Response of Echo Filter (P=5)");
%ε)Το br είναι για το φίλτρο αντήχησης (reverb), ενω το a είναι κοινό με τα
%προηγούμενα φίλτρα
br=[0.166375,0,0.408375,0,0.334125,0,0.091125];
figure(7);
freqz(br,a);
grid on;
title("Frequency Response of Reverb Filter");
figure(8);
zplane(br,a);
grid on;
title("Zero-Pole Diagramm of Reverb Filter");
figure(9);
impz(br,a);
grid on;
title("Impulse Response of Reverb Filter");
%στ) Το h1 είναι η κρουστική απόκριση του φίλτρου αντήχησης, ενώ το h2
%είναι η κορυστική απόκριση του φίλτρου απαλοιφής αντήχησης. Τα bd και ad
%είναι οι συντελεστές του φίλτρου απαλοιφής αντήχησης. Για να βρεθούν
%τα φιλτραρισμένα σήματα χρησιμοποιήθηκε η συνάρτηση conv()-συνέλιξη- και
%πήραμε το αρχικό μέρος των σημάτων(με τα 2 for) για να είναι πιο εύκολη η
%οπτικοποόησή τους στη γραφική παράσταση.
h1=impz(br,a);
ad=[0.166375,0,0.408375,0,0.334125,0,0.091125];
bd=[1];
h2=impz(bd,ad);
x=-1:13;
u=[0 1 1 1 1 1 0 0 0 0 0 0 0 0 0];
figure(10);
plot(x,u,'b.');
temp=conv(u,h1);
y1=temp(1:15);
hold on;
plot(x,y1,'gd');
temp=conv(y1,h2);
y2=temp(1:15);
plot(x,y2,'ro');
grid on;
title("Original,Reverbed and Dereverbed Signals");
legend("u[n]-u[n-5]","reverbed signal","dereverbed signal");
xlabel("n (samples)");
ylabel("Amplitude");

%1.2:
%α)p: οι πόλοι, z: τα μηδενικά του φίλτρου, bz και az οι συντελεστές των
%εξισώσεων διαφορών που αντιστοιχούν στο κάθε φίλτρο
p=[0.65+0.65i 0.65+0.65i 0.65-0.65i 0.65-0.65i];
z=[0.8 0.8 0.8i -0.8i];
p=p(:);
z=z(:);
figure(11);
zplane(z,p);
grid on;
title("Zero-Pole Diagramm of Bandpass Filter 1");
[bz1,az1]=zp2tf(z,p,1);
%β)
figure(12);
freqz(bz1,az1);
grid on;
title("Frequency Response of Bandpass Filter 1");
%γ)
figure(13);
impz(bz1,az1);
grid on;
title("Impulse Response of Bandpass Filter 1");
figure(14);
stepz(bz1,az1);
grid on;
title("Step Response of Bandpass Filter 1");
%δ)
p=[0.7+0.7i 0.7+0.7i 0.7-0.7i 0.7-0.7i];
p=p(:);
figure(15);
zplane(z,p);
grid on;
title("Zero-Pole Diagramm of Bandpass Filter 2");
[bz2,az2]=zp2tf(z,p,1);
figure(16);
freqz(bz2,az2);
grid on;
title("Frequency Response of Bandpass Filter 2");
figure(17);
impz(bz2,az2);
grid on;
title("Impulse Response of Bandpass Filter 2");
p=[0.707+0.707i 0.707+0.707i 0.707-0.707i 0.707-0.707i];
p=p(:);
figure(18);
zplane(z,p);
grid on;
title("Zero-Pole Diagramm of Bandpass Filter 3");
[bz3,az3]=zp2tf(z,p,1);
figure(19);
freqz(bz3,az3);
grid on;
title("Frequency Response of Bandpass Filter 3");
figure(20);
impz(bz3,az3);
grid on;
title("Impulse Response of Bandpass Filter 3");
p=[0.75+0.75i 0.75+0.75i 0.75-0.75i 0.75-0.75i];
p=p(:);
figure(21);
zplane(z,p);
grid on;
title("Zero-Pole Diagramm of Bandpass Filter 4");
[bz4,az4]=zp2tf(z,p,1);
figure(22);
freqz(bz4,az4);
grid on;
title("Frequency Response of Bandpass Filter 4");
figure(23);
impz(bz4,az4);
grid on;
title("Impulse Response of Bandpass Filter 4");
%ε)
p=[0.4+0.7i 0.4+0.7i 0.4-0.7i 0.4-0.7i];
p=p(:);
figure(24);
zplane(z,p);
grid on;
title("Zero-Pole Diagramm of Bandpass Filter 5");
[bz5,az5]=zp2tf(z,p,1);
figure(25);
freqz(bz5,az5);
grid on;
title("Frequency Response of Bandpass Filter 5");
%στ)
p=[0.65+0.65i 0.65+0.65i 0.65-0.65i 0.65-0.65i];
p=p(:);
z=[0.77+0.2i 0.2+0.77i 0.77-0.2i 0.2-0.77i];
z=z(:);
figure(26);
zplane(z,p);
grid on;
title("Zero-Pole Diagramm of Bandpass Filter 6");
[bz6,az6]=zp2tf(z,p,1);
figure(27);
freqz(bz6,az6);
grid on;
title("Frequency Response of Bandpass Filter 6");
z=[0.4+0.7i 0.7+0.4i 0.4-0.7i 0.7-0.4i];
z=z(:);
figure(28);
zplane(z,p);
grid on;
title("Zero-Pole Diagramm of Bandpass Filter 7");
[bz7,az7]=zp2tf(z,p,1);
figure(29);
freqz(bz7,az7);
grid on;
title("Frequency Response of Bandpass Filter 7");

s=29;

%2.1:
%α)
[Y,fs]=audioread('viola_series.wav');
figure(1+s);
dt=1/44100;
t=0:dt:9;
plot(t,Y(1:396901));
grid on;
title('Signal viola series');
xlabel('Time (sec)');
sound(Y,fs);
%β)
m=max(max(Y),abs(min(Y)));
y=Y/m;
n=0:999;
w=0.54+0.46*cos(2*pi.*n/1000);
figure(2+s);
plot(t,50*y(1:396901));
y2=y.*y;
E=conv(y2,w);
hold on;
plot(t,E(1:396901));
grid on;
title('Energy of signal viola series');
xlabel('Time (sec)');
%γ)
dft1=fft(Y,fs);
figure(3+s);
plot(abs(dft1(1:6000)));
grid on;
title('DFT of signal viola series');
xlabel('Frequency (Hz)');

%δ)
dnpart=Y(232000:233000);
figure(4+s);
t=0:(dt*1000):(10000/441);
plot(t,dnpart(1:1001));
grid on;
title('Viola D4 note instance');
xlabel('Time (msec)');

%ε)
Dnote=Y(220500:286650);
dft2=fft(Dnote,fs);
figure(5+s);
plot(abs(dft2(1:6001)));
grid on;
title('DFT of viola D4 note');
xlabel('Frequency (Hz)');

%στ)
[Enote,fs]=audioread('viola_note.wav');
figure(6+s);
t=0:dt:(200/147);
plot(t,Enote(1:60001));
grid on;
title('Signal viola note');
xlabel('Time (sec)');
dft3=fft(Enote,fs);
figure(7+s);
plot(abs(dft3(1:6001)));
grid on;
title('DFT of viola E4 note');
xlabel('Frequency (Hz)');

%2η αρμονική
pp2=[0.9957+0.0923i 0.9957+0.0923i 0.9957-0.0923i 0.9957-0.0923i];
zz2=[0.995+0.0923i 0.9957+0.092i 0.995-0.0923i 0.9957-0.092i];
pp2=pp2(:);
zz2=zz2(:);
[bzz2,azz2]=zp2tf(zz2,pp2,1);
hzon2=impz(bzz2,azz2);
out2=conv(Enote,hzon2);
figure(8+s);
t=0:dt*1000:(5/441)*1000;
plot(t,out2(70000:70500));
grid on;
title('Section of 2nd Harmonic of viola E4 note');
xlabel('Time (msec)');
dft4=fft(out2,fs);
figure(9+s);
plot(abs(dft4(1:6001)));
grid on;
title('DFT of filtered viola E4 note (2nd harmonic)');
xlabel('Frequency (Hz)');

%4η αρμονική
pp4=[0.9828+0.1844i 0.9828+0.1844i 0.9828-0.1844i 0.9828-0.1844i];
zz4=[0.982+0.1844i 0.9828+0.184i 0.982-0.1844i 0.9828-0.184i];
pp4=pp4(:);
zz4=zz4(:);
[bzz4,azz4]=zp2tf(zz4,pp4,1);
hzon4=impz(bzz4,azz4);
out4=conv(Enote,hzon4);
figure(10+s);
plot(t,out4(30000:30500));
grid on;
title('Section of 4th Harmonic of viola E4 note');
xlabel('Time (msec)');
dft5=fft(out4,fs);
figure(11+s);
plot(abs(dft5(1:6001)));
grid on;
title('DFT of filtered viola E4 note (4th harmonic)');
xlabel('Frequency (Hz)');

%2.2:
%α)
[piano,fs]=audioread('piano_note.wav');
figure(12+s);
t=0:dt:(49999*dt);
plot(t,piano(1:50000));
grid on;
title('Signal piano note');
xlabel('Time (sec)');
%β)
as=[1];
bech=zeros(1,6616);
bech(1)=0.6;
bech(6616)=0.4;
ecim=impz(bech,as);
brev=zeros(1,19846);
brev(1)=0.216;
brev(6616)=0.432;
brev(13231)=0.288;
brev(19846)=0.064;
reim=impz(brev,as);
echoed=conv(piano,ecim);
reverbed=conv(piano,reim);
figure(13+s);
t=0:dt:(56614*dt);
plot(t,echoed(1:56615));
grid on;
title('Echoed piano note');
xlabel('Time (sec)');
figure(14+s);
t=0:dt:(69844*dt);
plot(t,reverbed(1:69845));
grid on;
title('Reverbed piano note');
xlabel('Time (sec)');
figure(15+s);
t=0:dt:(49999*dt);
plot(t,piano(1:50000));
hold on;
plot(t,echoed(1:50000));
plot(t,reverbed(1:50000));
title('Original/Echoed/Reverbed piano note');
xlabel('Time (sec)');
legend('Original','Echoed','Reverbed');
sound(echoed,fs);
sound(reverbed,fs);
%γ)
orft=fft(piano,fs);
figure(16+s);
f=1:44100;
plot(f,mag2db(abs(orft)));
grid on;
title('DFT of signal piano note');
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');
ecft=fft(echoed,fs);
figure(17+s);
plot(f,mag2db(abs(ecft)));
grid on;
title('DFT of echoed piano note');
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');
reft=fft(reverbed,fs);
figure(18+s);
plot(f,mag2db(abs(reft)));
grid on;
title('DFT of reverbed piano note');
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');
figure(19+s);
plot(f,mag2db(abs(orft)));
hold on;
plot(f,mag2db(abs(ecft)));
plot(f,mag2db(abs(reft)));
title('DFT of original/echoed/reverbed piano note');
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');
legend('Original','Echoed','Reverbed');
%δ)
bte=zeros(1,1200);
bte(1)=0.6;
bte(1200)=0.4;
teim=impz(bte,as);
tesi=conv(piano,teim);
sound(tesi,fs);
%ε)
audiowrite('echoed.wav',echoed,fs);
audiowrite('reverbed.wav',reverbed,fs);
%στ)
adrev=zeros(1,19846);
adrev(1)=0.216;
adrev(6616)=0.432;
adrev(13231)=0.288;
adrev(19846)=0.064;
bdrev=[1];
dereverbed=filter(bdrev,adrev,reverbed);
figure(20+s);
plot(piano);
hold on;
plot(dereverbed);
title('Original and Dereverbed signals');
xlabel('Time (sec)');
legend('Original','Dereverbed');
hs=filter(bdrev,adrev,reim);
%ζ)
adrev5=zeros(1,19861);
adrev5(1)=0.216;
adrev5(6621)=0.432;
adrev5(13241)=0.288;
adrev5(19861)=0.064;
dereverbed5=filter(bdrev,adrev5,reverbed);
figure(21+s);
t=0:dt:1.5;
plot(t,dereverbed5(1:66151));
grid on;
title('Dereverbed signal (5 samples off)');
xlabel('Time (sec)');
h5=filter(bdrev,adrev5,reim);

adrev10=zeros(1,19876);
adrev10(1)=0.216;
adrev10(6626)=0.432;
adrev10(13251)=0.288;
adrev10(19876)=0.064;
dereverbed10=filter(bdrev,adrev10,reverbed);
figure(22+s);
plot(t,dereverbed10(1:66151));
grid on;
title('Dereverbed signal (10 samples off)');
xlabel('Time (sec)');
h10=filter(bdrev,adrev10,reim);

adrev50=zeros(1,19996);
adrev50(1)=0.216;
adrev50(6666)=0.432;
adrev50(13331)=0.288;
adrev50(19996)=0.064;
dereverbed50=filter(bdrev,adrev50,reverbed);
figure(23+s);
plot(t,dereverbed50(1:66151));
grid on;
title('Dereverbed signal (50 samples off)');
xlabel('Time (sec)');
h50=filter(bdrev,adrev50,reim);

figure(24+s);
t=0:dt:(9/20);
plot(t,hs(1:19846));
grid on;
title('Total Impulse Response for Reverb/Dereverb System');
xlabel('Time (sec)');
figure(25+s);
plot(t,h5(1:19846));
grid on;
title('Total Impulse Response for Reverb/Dereverb (5 samples off) System');
xlabel('Time (sec)');
figure(26+s);
plot(t,h10(1:19846));
grid on;
title('Total Impulse Response for Reverb/Dereverb (10 samples off) System');
xlabel('Time (sec)');
figure(27+s);
plot(t,h50(1:19846));
grid on;
title('Total Impulse Response for Reverb/Dereverb (50 samples off) System');
xlabel('Time (sec)');