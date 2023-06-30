# John Eargle (mailto: jeargle at gmail.com)
# test
#
# To build sysimage boom.so from chorochronodesy/test:
#   using PackageCompiler
#   create_sysimage([:Plots, :Printf], sysimage_path="../boom.so", precompile_execution_file="so_builder.jl")
#
# To run from uveldt/test:
#   julia --project=.. -J../boom.so test.jl


using Dates

using Plots
using Printf

using chorochronodesy


function print_test_header(test_name)
    border = repeat("*", length(test_name) + 4)
    println(border)
    println("* ", test_name, " *")
    println(border)
end

function test_one()
    print_test_header("One")

    println()
end



function main()
    test_one()
end

main()
