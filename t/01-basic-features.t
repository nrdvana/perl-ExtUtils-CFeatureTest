use Test::More;
use strict;
use warnings;

use ExtUtils::CFeatureTest;

my $ctest= ExtUtils::CFeatureTest->new();

ok( $ctest->compile_and_run(<<END_C), 'simple int main program' );
int main() { return 0; }
END_C

ok( !$ctest->compile_and_run(<<END_C), 'program returns error' );
int main() { return 1; }
END_C

ok( !$ctest->compile_and_run(<<END_C), 'link failure' );
extern int missing_external_function();
int main() { return missing_external_function(); }
END_C

ok( !$ctest->compile_and_run(<<END_C), 'compile failure' );
int main() { return syntax error!; }
END_C

done_testing;
