requires 'perl', 'v5.10.1';

on build => sub {
  requires 'Module::Build', '0.3601';
};

on configure => sub {
  requires 'Module::Build', '0.3601';
};

on test => sub {
  requires 'Test::More', '0.96';
  requires 'Test::LWP::UserAgent', '0';
};

requires 'Catmandu', '>=0.94';
requires 'Business::ISSN', '0.91';
requires 'Business::ISBN', '2.09';
requires 'Data::UUID',0;
requires 'LWP::Simple',0;
requires 'WWW::ORCID',0;
requires 'Data::Validate::URI',0;