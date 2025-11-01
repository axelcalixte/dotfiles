function create_days_dir -a dir
	set real_dir "."
	if [ "$dir" != "" ]
		set real_dir $dir	
	end

	for i in (seq -w 1 25)
		mkdir "$real_dir"/"$i"
	end
end
