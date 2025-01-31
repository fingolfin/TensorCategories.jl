module TensorCategories

import Base: *, +, -, ==, ^, getindex, getproperty, in, issubset, iterate, length, show,div

import Oscar: +, AbstractSet, AlgAss, AlgAssElem, AcbField, Field, FieldElem, FinField, GroupsCore,
    FiniteField, GAP, GAPGroup, GAPGroupHomomorphism, GL, GSet, GroupElem, Ideal, MPolyQuo,
    Map, MatElem, MatrixElem, MatrixGroup, MatrixSpace, ModuleIsomorphism, NumberField,
    PolynomialRing, QQ, Ring, RingElem, ZZ, abelian_closure, action, base_field, base_ring,
    basis, change_base_ring, characteristic, codomain, coeff, coefficients, cokernel,
    compose, cyclotomic_field, decompose, degree, diagonal_matrix, dim, domain, dual,
    eigenspace, eigenspaces, elem_type, elements, fmpq, fmpz, gcd, gen, gens,
    groebner_basis, gset, hom, id, ideal, image, index, inv, irreducible_modules, is_abelian,
    is_central, iscommutative, isconstant, isindependent, isinvertible, is_isomorphic,
    is_semisimple, is_subgroup, jordan_normal_form, kernel, kronecker_product,
    leading_monomial, left_transversal, matrix, minpoly, real_solutions, multiplication_table,
    nf_elem, one, orbit, orbits, order, parent, permutation_matrix, primary_decomposition,
    product, rank, roots, rref, size, solve, solve_left, splitting_field, stabilizer,
    symmetric_group, tensor_product, tr, zero, ∘, ⊕, ⊗, iso_oscar_gap, preimage, is_simple,
    CyclotomicField, absolute_simple_field, is_abelian, is_square, charpoly, det, load,save,
    factor, zero_matrix, identity_matrix, complex_embeddings, QQBar, eigenvalues, @alias,
    abelian_group, PcGroup, is_modular, subgroup, nullspace, factor, qqbar,
    leading_coefficient, roots, is_rational, QQMPolyRingElem, lex, Fac, root_of_unity, PolyElem, MPolyElem, monomials, fmpq_poly, MPolyIdeal,
    height_bits, lcm, change_base_ring, guess, direct_sum, matrix_algebra,
    @attributes, Hecke.AbsAlgAss, Hecke.AbsAlgAssElem, has_attribute, tensor_power, spectrum, exponent, sparse_matrix, exponents, symbols,
    nvars, resultant,QQFieldElem, ZZRingElem, divisors, is_finite, is_subfield, multiplicity, gmodule, trivial_subgroup, hnf, get_attribute, set_attribute!, get_attribute!, central_primitive_idempotents, is_invertible,
    involution

import Oscar.GModuleFromGap: home_base

import Oscar.AbstractAlgebra.Generic: Poly

using Memoization, InteractiveUtils, SparseArrays

export - 
export * 
export ^ 
export ∐ 
export + 
export × 
export == 
export ∘ 
export ⊕ 
export ⊗ 
export ⊠ 
export AbstractHomSpace 
export add_simple! 
export associator 
export base_ring 
export base_group
export basis 
export braiding 
export cat_fr_8122 
export cat_fr_9143 
export Category 
export category
export HomSet 
export HomSpace 
export Morphism 
export Object 
export Center 
export center_simples 
export CenterCategory 
export CenterCategory 
export CenterMorphism 
export CenterMorphism 
export CenterObject 
export CenterObject 
export central_objects 
export central_primitive_idempotents
export Cocycle 
export codomain 
export coefficients
export coev 
export CohSfHomSpace 
export CohSheafMorphism 
export CohSheafObject 
export CohSheaves 
export cokernel 
export compose 
export ConvHomSpace 
export ConvolutionCategory 
export ConvolutionMorphism 
export ConvolutionObject 
export coproduct 
export cyclic_group_3cocycle 
export decompose 
export direct_sum_decomposition
export DeligneProdMorphism 
export DeligneProdObject 
export DeligneProduct 
export dim 
export direct_sum 
export direct_sum 
export distribute_left 
export distribute_right 
export domain 
export drinfeld_morphism 
export dual 
export dual_basis 
export E6subfactor 
export eigenspace 
export eigenvalues 
export End 
export end_of_induction
export endomorphism_ring 
export ev 
export ev_coev 
export exponent
export express_in_basis 
export extension_of_scalars
export factor 
export Fibonacci 
export Forgetful 
export fpdim 
export Functor 
export FusionCategory 
export getindex 
export GradedVectorSpaces 
export GRHomSpace 
export GRepInduction 
export GRepRestriction 
export split_grothendieck_ring 
export GrothendieckRing
export GroupRepresentation 
export GroupRepresentationCategory 
export GroupRepresentationCategory 
export GroupRepresentationMorphism 
export GVSHomSpace 
export GVSMorphism 
export GVSObject 
export HaagerupH3 
export half_braiding 
export half_braidings 
export hexagon_axiom
export hom 
export Hom 
export HomFunctor 
export horizontal_direct_sum
export I2 
export I2subcategory 
export id 
export image 
export indecomposable_subobjects
export indecomposables
export induction 
export Induction 
export induction_restriction
export int_dim 
export inv 
export inv_associator 
export involution
export is_abelian 
export is_abelian 
export is_additive 
export is_braided
export is_central
export is_finite 
export is_fusion 
export is_half_braiding 
export is_linear 
export is_modular 
export is_monoidal 
export is_multifusion 
export is_multifusion 
export is_multiring 
export is_multitensor 
export is_ring 
export is_ring 
export is_semisimple 
export is_simple 
export is_spherical 
export is_subobject 
export is_tensor 
export isequivariant 
export isgraded 
export Ising 
export isinvertible
export karoubian_envelope 
export kernel 
export left_dual 
export left_inverse 
export left_trace 
export load 
export matrices 
export matrix 
export Morphism, morphism 
export multiplication_table 
export multiplicity
export normalized_smatrix 
export object 
export object_type 
export one 
export op 
export OppositeCategory 
export OppositeMorphism 
export OppositeObject 
export orbit_index 
export orbit_stabilizers 
export pairing 
export parent 
export pentagon_axiom 
export pentagon_equations
export print_multiplication_table 
export print_multiplication_table 
export product 
export ProductCategory 
export ProductMorphism 
export ProductObject 
export Pullback 
export PullbackFunctor 
export Pushforward 
export PushforwardFunctor 
export QuantumZZRing
export QuantumZZRingElem
export QZZ
export rational_lift 
export regular_representation
export Representation 
export RepresentationCategory 
export restriction 
export Restriction 
export reverse_braiding
export right_dual 
export right_inverse 
export right_trace 
export RingCatMorphism 
export RingSubcategory 
export roots 
export save 
export Semisimplification
export SemisimplifiedObject
export SemisimplifiedMorphism
export semisimplify
export SixJCategory 
export SixJObject 
export set_associator! 
export set_braiding! 
export set_canonical_spherical! 
export set_one! 
export set_spherical! 
export set_tensor_product! 
export SetHomSet 
export SetMorphism 
export SetObject 
export Sets 
export simple_subobjects 
export simples 
export simples_names 
export six_j_symbols 
export smatrix 
export solve_groebner 
export sort_simples_by_dimension! 
export spherical 
export stalk 
export stalks 
export SubcategoryObject 
export SubcategoryMorphism 
export TambaraYamagami 
export tensor_product 
export tensor_power
export TensorPowerCategory
export TensorPowerMorphism
export TensorPowerObject
export tmatrix 
export tr 
export trivial_3_cocylce 
export TwistedGradedVectorSpaces 
export UqSl2Representations
export VectorSpaceMorphism 
export VectorSpaceObject 
export VectorSpaces 
export Verlinde
export vertical_direct_sum
export VSHomSpace 
export VSObject 
export zero 
export zero_morphism 
export ZPlusRing, ℕRing, ℤ₊Ring
export ZPlusRingElem, ℕRingElem, ℤ₊RingElem


include("CategoryFramework/AbstractTypes.jl")
include("CategoryFramework/AbstractMethods.jl")
include("CategoryFramework/FrameworkChecks.jl")
include("CategoryFramework/ProductCategory.jl")
include("CategoryFramework/Fallbacks.jl")
include("CategoryFramework/OppositeCategory.jl")
include("CategoryFramework/DeligneTensorProduct.jl")
include("CategoryFramework/Semisimplification.jl")

include("Utility/QQBar_Polynomials.jl")
include("Utility/SolveGroebner.jl")
include("Utility/QuantumIntegers.jl")
include("Utility/Technicallities.jl")

include("Examples/GradedVectorSpaces/VectorSpaces.jl")
include("Examples/GradedVectorSpaces/Cocycles.jl")
include("Examples/GradedVectorSpaces/GradedVectorSpaces.jl")
include("Examples/GradedVectorSpaces/Unitary-3-cocycle.jl")
include("Examples/Sets/Sets.jl")
include("Examples/GroupRepresentations/Representations.jl")
include("Examples/GroupRepresentations/GroupRepresentations.jl")
include("Examples/ConvolutionCategory/CoherentSheaves.jl")
include("Examples/ConvolutionCategory/ConvolutionCategory.jl")

include("TensorCategoryFramework/AbstractTensorMethods.jl")
include("TensorCategoryFramework/FusionCategory.jl")
#include("structures/MultiFusionCategories/FusionCategoryExperimental.jl")
include("TensorCategoryFramework/6j-Solver.jl")
include("TensorCategoryFramework/Skeletization.jl")
include("TensorCategoryFramework/PentagonAxiom.jl")
include("TensorCategoryFramework/HexagonAxion.jl")
include("TensorCategoryFramework/RingSubcategories.jl")
include("TensorCategoryFramework/TensorPowerCategory.jl")
include("TensorCategoryFramework/TensorFunctors.jl")
include("TensorCategoryFramework/Center/Center.jl")
include("TensorCategoryFramework/Center/Induction.jl")
include("TensorCategoryFramework/Center/CenterChecks.jl")

include("DecategorifiedFramework/multiplication_table.jl")
include("DecategorifiedFramework/ZPlusrings.jl")
include("DecategorifiedFramework/GrothendieckRing.jl")


include("Examples/Verlinde/I2-fusion.jl")
include("Examples/Verlinde/Verlinde.jl")
include("Examples/UqSl2Representations/RepresentationsSL2.jl")
include("Examples/TambaraYamagami/TambaraYamagami.jl")
include("Examples/Fibonacci/FibonacciCategory.jl")
include("Examples/VercleyenSingerland/FR_8211/fr_8211.jl")
include("Examples/VercleyenSingerland/FR_9143/fr_9143.jl")
include("Examples/E6subfactor/E6subfactor.jl")
include("Examples/Haagerup/Haagerup.jl")




#include("Utility/Serialization.jl")

@alias Centre Center

end
