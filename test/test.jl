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
using Unitful

using chorochronodesy


function print_test_header(test_name)
    border = repeat("*", length(test_name) + 4)
    println(border)
    println("* ", test_name, " *")
    println(border)
end

function test_ex_1_1()
    print_test_header("Exercises 1.1")

    # println(natural(10u"J"))
    # println(natural(100u"W"))

    # (a)
    x = 10u"J"
    time_power = 0
    for i in typeof(typeof(x).parameters[2]).parameters[1]
        dim = typeof(i).parameters[1]
        println("  ", dim, " ", i.power)
        if dim == :Time
            time_power = i.power
        end
    end
    println("time_power: ", time_power)

    mps = 3e8

    # z = x * (1/9e16)u"m^-2*s^2"
    z = x * (mps^time_power) * u"m"^time_power * u"s"^(-time_power)
    println("x: ", x)
    println("z: ", z)
    println(typeof(unit(z)))
    println(uconvert(u"kg", z))
    z = gr_convert(x)
    println("z: ", z)
    println(uconvert(u"kg", z))
    y = si_convert(z, -2)
    println("y: ", y)
    println(uconvert(u"J", y))
end



function main()
    test_ex_1_1()
end

main()
