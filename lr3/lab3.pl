open inputFile,"<lab3input.txt" or die "Ошибка открытия файла lab3input.txt:$!";
open outputFile,">lab3output.txt" or die "Ошибка открытия файла lab3output.txt:$!";

@_=<inputFile>;

close inputFile or die $!;

$_ = join"",@_;

$_=~tr/" "/" "/s;
$_=~tr/"\n"/"\n"/s;

print $_;

print outputFile  $_;

close outputFile or die $!;