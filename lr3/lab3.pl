open inputFile,"<lab3input.txt" or die "������ �������� ����� lab3input.txt:$!";
open outputFile,">lab3output.txt" or die "������ �������� ����� lab3output.txt:$!";

@_=<inputFile>;

close inputFile or die $!;

$_ = join"",@_;

$_=~tr/" "/" "/s;
$_=~tr/"\n"/"\n"/s;

print $_;

print outputFile  $_;

close outputFile or die $!;