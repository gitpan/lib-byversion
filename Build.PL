
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.4202"
  },
  "configure_requires" => {
    "Module::Build" => "0.4202"
  },
  "dist_abstract" => "add paths to \@INC depending on which version of C<perl> is running.",
  "dist_author" => [
    "Kent Fredric <kentfredric\@gmail.com>"
  ],
  "dist_name" => "lib-byversion",
  "dist_version" => "0.001001",
  "license" => "perl",
  "module_name" => "lib::byversion",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "String::Formatter" => 0,
    "lib" => 0,
    "perl" => "5.006",
    "strict" => 0,
    "version" => "0.77",
    "warnings" => 0
  },
  "script_files" => [],
  "test_requires" => {
    "Test::More" => "1.001002"
  }
);


my %fallback_build_requires = (
  "Module::Build" => "0.4202",
  "Test::More" => "1.001002"
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  delete $module_build_args{test_requires};
  $module_build_args{build_requires} = \%fallback_build_requires;
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
