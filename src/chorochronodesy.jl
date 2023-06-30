# John Eargle (mailto: jeargle at gmail.com)
# chorochronodesy

module chorochronodesy

using Plots
using Printf


export Event, SpacetimeTrajectory


"""
Model for spacetime event.
"""
struct Event
    x::Float64
    t::Float64

    function Event(x::Float64, t::Float64) = new(x, t)
end

Base.show(io::IO, event::Event) = show(io, string(event.x, ", ", event.t))
Base.show(io::IO, m::MIME"text/plain", event::Event) = show(io, m, string(event.x, ", ", event.t))


"""
Model for spacetime trajectory.
"""
struct SpecetimeTrajectory
    events::Array{Event, 1}

    function SpacetimeTrajectory(events::Array{Event, 1}) = new(events)
end

Base.show(io::IO, stTraj::SpacetimeTrajectory) = show(io, string("blah"))
Base.show(io::IO, m::MIME"text/plain", stTraj::SpacetimeTrajectory) = show(io, m, string("blah"))


end
