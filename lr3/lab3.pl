open inputFile,"<lab3input.cpp" or die "Ошибка открытия файла lab3input.cpp:$!";
open outputFile,">lab3output.cpp" or die "Ошибка открытия файла lab3output.cpp:$!";

@_=<inputFile>;

close inputFile or die $!;

$_ = join"",@_;

$_=~tr/" "//s;
$_=~tr/"\n"//s;
$_=~tr/"\t"//s;
$_=~s/\/\*.*?\*\///sg;
$_=~s/\/\/.*?\n//g;

print $_;
print outputFile  $_;

close outputFile or die $!;