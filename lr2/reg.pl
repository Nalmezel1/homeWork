open inputFile,"<input.java" or die "Ошибка открытия файла input.java:$!";
open outputFile,">output.java" or die "Ошибка открытия файла output.java:$!";

@_=<inputFile>;
close inputFile or die $!;

$_ = join"",@_;
print "$_";

my @mas = /\b[a-zA-Z_][\w]*\b/g;


print outputFile  @mas, "\n";
print "\n" ,"@mas";

close outputFile or die $!;