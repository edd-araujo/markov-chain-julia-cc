function clear_screen()
	if Sys.iswindows()
			run(`cmd /c cls`)
	else
			run(`clear`)
	end
end