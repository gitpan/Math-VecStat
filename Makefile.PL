use ExtUtils::MakeMaker;
use Config;

$Version = '0.06';

WriteMakefile(
               'NAME'     => 'Math::VecStat',
               'LINKTYPE' => '$(INST_PM)',,
               'VERSION'  => $Version,
               'dist'     => { SUFFIX => 'gz', COMPRESS => 'gzip -f' },
               'clean' 	  => {'FILES' => '*~'},
);
