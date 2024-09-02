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

    cases = [Dict("desc" => "energy",
                  "value" => 10u"J",
                  "units" => u"kg"),
             Dict("desc" => "power output",
                  "value" => 100u"W",
                  "units" => u"kg/m"),
             Dict("desc" => "hbar",
                  "value" => 1.05e-34u"J*s",
                  "units" => u"kg*m"),
             Dict("desc" => "velocity of car",
                  "value" => 30u"m*s^-1"),
             Dict("desc" => "momentum of car",
                  "value" => 3e4u"kg*m*s^-1"),
             Dict("desc" => "one atmosphere of pressure",
                  "value" => 1e5u"N*m^-2",
                  "units" => u"kg*m^-3"),
             Dict("desc" => "density of water",
                  "value" => 1e3u"kg*m^-3"),
             Dict("desc" => "luminosity flux",
                  "value" => 1e6u"J*s^-1*cm^-2",
                  "units" => u"kg*m^-3")]

    for case in cases
        println(case["desc"], ":")
        println("  ", case["value"])
        gr_value = gr_convert(case["value"])
        println("  ", gr_value)
        if haskey(case, "units")
            println("  ", uconvert(case["units"], gr_value))
        end
        println("  ", dimension(gr_value))
    end
end

function test_ex_1_2()
    print_test_header("Exercises 1.2")

    cases = [Dict("desc" => "velocity",
                  "value" => 1e-2,
                  "time_power" => -1),
             Dict("desc" => "pressure",
                  "value" => 1e19u"kg*m^-3",
                  "time_power" => 0),
             Dict("desc" => "time",
                  "value" => 1e18u"m",
                  "time_power" => 1),
             Dict("desc" => "energy density",
                  "value" => 1u"kg*m^-3",
                  "time_power" => -2,
                  "units" => u"J*m^-3"),
             Dict("desc" => "acceleration",
                  "value" => 10u"m^-1",
                  "time_power" => -2)]

    for case in cases
        println(case["desc"], ":")
        println("  ", case["value"])
        si_value = si_convert(case["value"], case["time_power"])
        println("  ", si_value)
        if haskey(case, "units")
            println("  ", uconvert(case["units"], si_value))
        end
        println("  ", dimension(si_value))
    end
end



function main()
    test_ex_1_1()
    test_ex_1_2()
end

main()
