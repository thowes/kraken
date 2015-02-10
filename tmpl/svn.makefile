info:
	@svn info

orig:
	@svn info|grep "Repository Root"

rev:
	@svn info|grep Revision

st:
	@svn status

up:
	@svn update
