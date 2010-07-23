use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Task::Template::Benchmark',
    license             => 'perl',
    dist_author         => q{Sam Graham <perl-modules@illusori.co.uk>},
    dist_version_from   => 'lib/Task/Template/Benchmark.pm',
    build_requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'Task-Template-Benchmark-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
