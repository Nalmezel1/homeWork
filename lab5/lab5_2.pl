use Cwd 'abs_path';

sub scan_dir {

    my $files;
    my $fileWithStr;
    my $allSubs;

    my ($dir) = @_;
    my $sub;

    for my $file (glob($dir.'/*'))
    {
        if (-d $file)
        {
            $sub = scan_dir($file);
            $allSubs = $allSubs.$sub;
        }

        my @contentOfFile;


        if(-T $file && -s $file){
            print $file,"\n";

            open inputFile, $file or die "Ошибка открытия файла $file:$!";

            @contentOfFile = <inputFile>;

            $_ = join "", @contentOfFile;

            if (m/hello/i) {

                $fileWithStr =$fileWithStr.abs_path($file)." ";

            }
            close inputFile or die $!;

        }

    }

    $files = $files." ".$fileWithStr." ".$allSubs,"\n";

    return $files;

}

my $dir = ".";

my $files = scan_dir ( $dir );
$files=~tr/ /\n/s;

print $files;

open outputFile, ">output.txt" or die "Ошибка открытия файла output.txt:$!";

print outputFile  $files;

close outputFile or die $!;