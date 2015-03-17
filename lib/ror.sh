#!/bin/bash
#ror.sh, L 5.1.2014
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri ROR; fi

ror_rails() {
	case $1 in
		c) rails console $2 $3;;
		g) ror_gen $2 $3 $4;;	
		gen) ror_gen $2 $3 $4;;	
		new) rails new $2 --skip-test-framework;;
		s) rails s;;
		sandbox) rails c --sandbox;;
		*) virhe "ROR/rails" $1 "ei tunnistettu!";;
	esac
}

ror_bundle() {
	case $1 in
		ass) bundle exec rake asset:precompile;;
		db) kaiku ROR rake db migrate; ror_bundle dbmig; kaiku ROR rake test prepare; ror_bundle testprep;;
		dbmig) bundle exec rake db:migrate;;
		indev) bundle install --without production;;
		iprod) bundle install --without development;;
		mig) ror_bundle db;;
		rake) bundle exec rake $2 $3;;
		rb) bundle exec rake db:rollback;;
		testprep) bundle exec rake test:prepare;;
		upd) bundle update;;
	esac
}

ror_tst() {
	kaiku ROR TST $1
	case $1 in
		ctrl) bundle exec rspec spec/controllers/;;
		cuc) bundle exec cucumber features/;;
		mdl) bundle exec rspec spec/models/;;
		req) bundle exec rspec spec/requests/;;
		spec) bundle exec rspec spec/;;
		view) bundle exec rspec spec/views/;;
		*) bundle exec rspec spec/; kaiku ROR TST cucumber; bundle exec cucumber features/|grep passed;;
	esac
}

ror_vagrant() {
	case $1 in
		add) vagrant box add $2;;
		init) vagrant init $2;;
		lst) echo ls -la;;
		ssh) vagrant ssh;;
		up) vagrant up;;
		*) echo "[[ KRAKEN/ROR vagrant $1: ei tunnistettu! ]]";;
	esac
}
