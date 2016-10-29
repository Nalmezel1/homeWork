open inputFile,"<lab4input.cpp" or die "Ошибка открытия файла lab4input.cpp:$!";
open outputFile,">lab4output.cpp" or die "Ошибка открытия файла lab4output.cpp:$!";

@_=<inputFile>;

close inputFile or die $!;

$_ = join"",@_;

my @mas = ("int", "float", "bool", "String");

$_=~tr/" "//s;
$_=~tr/"\n"//s;
$_=~tr/"\t"//s;
$_=~s/\/\*.*?\*\///sg;
$_=~s/\/\/.*?\n//g;

my @stringMas = m/\".*?\"/sg;
#print "\n","@stringMas","\n";
foreach my $z (0..$#stringMas)
{
    my $str = "str".$z;
    $_=~s/@stringMas[$z]/$str/g;
    print "\n",@stringMas[$z],"\n";
    print "\n",$str,"\n";
}

my $strWithoutString = $_;

#print $strWithoutString;

my @classMas= m/class\s\w+[{\n]/g;
my $classStr = join" ",@classMas;
$classStr =~s/class//g;
$_ = $classStr;
my @classNames = m/\b[a-zA-Z_][\w]*\b/g;
$_ = $strWithoutString;
foreach my $o (0..$#classNames){
    my $classRename = "C".$o;
    push @mas, $classRename;
    $_=~s/\b@classNames[$o]\b/$classRename/g;
}

#print $_;

#print "\n",@mas,"\n";

my @idMas;
my @endMas;

#print $_;

my $str = $_;

foreach my $i (0..$#mas) {
    #@outputMas = m/$mas[0](\s(\w+[\(\)])|((\w+,)*\w+;))/sg;
    #push @idMas,  m/$mas[$i]\s[\w+,\s]*\w+[;\)]/g;
    push @idMas,  m/$mas[$i]\s.+?[;\)]/g;
    push @idMas,  m/$mas[$i]\s\w+\(/g;
}

print "\n", "@idMas", "\n";

$_ = join" ", @idMas;
foreach my $j (0..$#mas) {

    s/\b$mas[$j]\b//g
}

$_=~s/main//g;

@endMas = m/\b[a-z_][\w]*\b/ig;

#print "\n","@endMas","\n";

$_ = $str;
foreach my $l (0..$#endMas) {

    my $kon = "_".$l;
    $_=~s/\b@endMas[$l]\b/$kon/g;
}

foreach my $v (0..$#stringMas) {

    my $kon = "str".$v;
    $_=~s/$kon\b/@stringMas[$v]/g;
}

print $_;
print outputFile  $_;