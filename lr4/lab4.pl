open inputFile,"<lab4input.cpp" or die "Ошибка открытия файла lab4input.cpp:$!";
open outputFile,">lab4output.cpp" or die "Ошибка открытия файла lab4output.cpp:$!";

@_=<inputFile>;

close inputFile or die $!;

$_ = join"",@_;

my @mas = ("int", "float", "bool", "String");

my @classMas= m/class\s\w+[{\n]/g;
my $classStr = join" ",@classMas;
$classStr =~s/class//g;
$_ = $classStr;
my @classNames = m/\b[a-zA-Z_][\w]*\b/g;
$_ = join"",@_;
foreach my $o (0..$#classNames)

{
    my $classRename = "C".$o;
    push @mas, $classRename;
    $_=~s/\b@classNames[$o]\b/$classRename/g;
}

#print $_;

#print "\n",@mas,"\n";

my @idMas;
my @endMas;

$_=~tr/" "//s;
$_=~tr/"\n"//s;
$_=~tr/"\t"//s;
$_=~s/\/\*.*?\*\///sg;
$_=~s/\/\/.*?\n//g;

#print $_;

my $str = $_;

foreach my $i (0..$#mas) {
    #@outputMas = m/$mas[0](\s(\w+[\(\)])|((\w+,)*\w+;))/sg;
    push @idMas,  m/$mas[$i]\s[\w+,\s]*\w+[;\)]/g;
    push @idMas,  m/$mas[$i]\s\w+\(/g;
}

$_ = join" ", @idMas;
foreach my $j (0..$#mas) {

    s/$mas[$j]//g

}

$_=~s/main//g;


@endMas = m/\b[a-zA-Z_][\w]*\b/g;

#print "\n","@endMas","\n";

$_ = $str;
foreach my $l (0..$#endMas) {

    my $kon = "_".$l;
    $_=~s/\b@endMas[$l]\b/$kon/g;

}

#print $_;
print outputFile  $_;