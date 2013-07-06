use strict;
use warnings;
use Module::Build;

my %modules = (
        #  Template::Benchmark itself.
        'Template::Benchmark'       => 0,

        #  Optional bits for extra benchmark_template_engines behaviour.
        'Term::ProgressBar::Simple' => 0,
        'JSON::Any'                 => 0,

        #  File::Spec needed by plugins for:
        #    Mojo::Template, Tenjin, Text::MicroMason, Text::Templ.
        'File::Spec'                => 0,

        #  IO::File needed by plugins for:
        #    Mojo::Template, Tenjin.
        'IO::File'                  => 0,

        'HTML::Mason'               => 0,
        'HTML::Macro'               => 0,
        'HTML::Template'            => 0,
        'HTML::Template::Compiled'  => 0,
        'HTML::Template::Expr'      => 0,
        'HTML::Template::JIT'       => 0,
        'HTML::Template::Pro'       => 0,
        'Mojo'                      => 0,
        'Mojo::Template'            => 0,
        'NTS::Template'             => 0,
        'Parse::Template'           => 0,
        #  Need 0.000000004 for sorted hash-looping.
        'Solution'                  => '0.000000004',
        'Template::Alloy'           => 0,
        #  Lots of extras here...
        'Template::Sandbox'         => 0,
        'Cache::CacheFactory'       => 0,
        'Cache::Cache'              => 0,
        'Cache::FastMemoryCache'    => 0,
        'Cache::FastMmap'           => 0,
        'Cache::Ref'                => 0,
        'CHI'                       => 0,
        'Template::AutoFilter'      => '0.130420',
        'Template::Tiny'            => 0,
        'Template'                  => 0,
        'Template::Simple'          => '0.06',
        'Template::Stash::XS'       => 0,
        'Template::Parser::CET'     => 0,
        #  pre-0.05 Tenjin was an incompatible API change
        'Tenjin'                    => '0.05',
        'Text::Caml'                => '0.10',
        'Text::ClearSilver'         => 0,
        'Text::Clevery'             => 0,
        'Text::FastTemplate'        => '0.95',
        'Text::MicroMason'          => 0,
        'Text::MicroTemplate'       => 0,
        'Text::MicroTemplate::Extended' => 0,
        'Text::MiniTmpl'            => '1.1.1',
        'Text::ScriptTemplate'      => '0.08',
        'Text::SimpleTemplate'      => '0.36',
        'Text::Template'            => 0,
        'Text::Template::Simple'    => 0,
        'Text::TemplateLite'        => '0.01',
        'Text::Templet'             => '3.0',
        'Text::Tmpl'                => 0,
        #  0.2012 required to work on Strawberry Perl on Win32/XP
        'Text::Xslate'              => '0.2012',
        #  0.34 fixes (endian?) bug on Strawberry Perl on Win32/XP
        'Data::MessagePack'         => '0.34',
        #  1.0002 required for TextXlsateTT.
        'Text::Xslate::Bridge::TT2' => '1.0002',
    );

#  Prune the unsafe ones on windows.
delete @modules{ qw/
    HTML::Template::Compiled
    HTML::Template::JIT
    NTS::Template
    Template::Alloy
    Template::Tiny
    Text::ClearSilver
    Text::Template::Simple
    Text::Tmpl
    Term::ProgressBar::Simple
    / }
    if $^O =~ /MSWin/;

#  These appear to be fixed for windows.
#    Text::Clevery
#    Text::Xslate
#    Data::MessagePack
#    Text::Xslate::Bridge::TT2

my $builder = Module::Build->new(
    module_name         => 'Task::Template::Benchmark',
    license             => 'perl',
    dist_author         => q{Sam Graham <libtemplate-benchmark-perl@illusori.co.uk>},
    dist_version_from   => 'lib/Task/Template/Benchmark.pm',
    build_requires => {
        'Test::More'    => 0,
        #  0.36 required for "installdeps"
        'Module::Build' => '0.36',
    },
    requires => {
        %modules,
    },
    sign => 1,
    dynamic_config => 1,
);

$builder->create_build_script();
