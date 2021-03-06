struct Conditional{S <: OneOrMoreSymbols, F}
  name::S
  stepper::F
end

struct Gibbs{M<:Model, T<:Tuple} <: InferenceAlgorithm
  model::M
  algs::T
end
Gibbs(m, algs...) = Gibbs(m, algs)

function update(gibbs::Gibbs, state::S; kwargs...) where S
  # TODO: Allow user to 
  # - time variable updates.
  # - fix parameters.
  for s in gibbs.algs
    if s.name isa NTuple
      newvalues = s.stepper(gibbs.model, state)
      state = setproperties!!(state, newvalues)
    else
      newvalue = s.stepper(gibbs.model, state)
      state = setproperty!!(state, s.name, newvalue)
    end
  end
  return state
end
