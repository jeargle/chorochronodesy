# John Eargle (mailto: jeargle at gmail.com)
# chorochronodesy

module chorochronodesy

using Plots
using Printf
using Unitful
using UUIDs


export Event, SpacetimeTrajectory
export gr_convert, si_convert


"""
Model for spacetime event.
"""
struct Event
    x::Float64
    t::Float64

    Event(x::Float64, t::Float64) = new(x, t)
end

Base.show(io::IO, event::Event) = show(io, string(event.x, ", ", event.t))
Base.show(io::IO, m::MIME"text/plain", event::Event) = show(io, m, string(event.x, ", ", event.t))


"""
Model for spacetime trajectory.
"""
struct SpacetimeTrajectory
    events::Array{Event, 1}

    SpacetimeTrajectory(events::Array{Event, 1}) = new(events)
end

Base.show(io::IO, stTraj::SpacetimeTrajectory) = show(io, string("blah"))
Base.show(io::IO, m::MIME"text/plain", stTraj::SpacetimeTrajectory) = show(io, m, string("blah"))


function gr_convert(x)
    mps = 3e8
    time_power = 0

    for i in typeof(typeof(x).parameters[2]).parameters[1]
        dim = typeof(i).parameters[1]
        # println("  ", dim, " ", i.power)
        if dim == :Time
            time_power = i.power
        end
    end
    # println("time_power: ", time_power)

    return x * (mps^time_power) * u"m"^time_power * u"s"^(-time_power)
end


function si_convert(x, time_power)
    spm = 1/3e8

    return x * (spm^time_power) * u"m"^(-time_power) * u"s"^time_power
end

end
