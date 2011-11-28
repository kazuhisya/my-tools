Name: my-authorized_keys
Version: 0.0
Release: 1%{?dist}
Summary: my ssh authorized_keys
Group: Development
License: Other
BuildArch: noarch
Source0: authorized_keys
BuildRoot:  %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXX)
Packager: Kazuhisa Hara <kazuhisya@gmail.com>

%description
my ssh authorized_keys

%prep

%build

%install
mkdir -p $RPM_BUILD_ROOT/root/.ssh/
cp -Rp %{_sourcedir}/authorized_keys $RPM_BUILD_ROOT/root/.ssh/

%clean
rm -rf $RPM_BUILD_ROOT


%files
%defattr(-,root,root,-)
/root/.ssh/authorized_keys
