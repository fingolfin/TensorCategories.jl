struct OppositeCategory <: Category
    C::Category
end

struct OppositeObject <: Object
    parent::OppositeCategory
    X::Object
end


struct OppositeMorphism <: Morphism
    domain::OppositeObject
    codomain::OppositeObject
    m::Morphism
end

op(C::Category) = OppositeCategory(C)
op(X::Object) = OppositeObject(op(parent(X)),X)
op(f::Morphism) = OppositeMorphism(op(codomain(f)),op(domain(f)), f)

base_ring(C::OppositeCategory) = base_ring(C.C)
base_ring(X::OppositeObject) = base_ring(X.X)
parent(X::OppositeObject) = OppositeCategory(parent(X.X))

compose(f::OppositeMorphism, g::OppositeMorphism) = OppositeMorphism(compose(g.m,f.m))

function product(X::OppositeObject, Y::OppositeObject)
    Z,px = product(X.X,Y.X)
    return OppositeObject(Z), OppositeMorphism.(px)
end

function coproduct(X::OppositeObject, Y::OppositeObject)
    Z,ix = coproduct(X.X,Y.X)
    return OppositeObject(Z), OppositeMorphism.(ix)
end

function dsum(X::OppositeObject, Y::OppositeObject)
    Z,ix,px = coproduct(X.X,Y.X)
    return OppositeObject(Z), OppositeMorphism.(ix), OppositeMorphism.(px)
end

tensor_product(X::OppositeObject, Y::OppositeObject) = OppositeObject(tensor_product(X.X,Y.X))

one(C::OppositeCategory) = OppositeObject(one(C.C))

simples(C::OppositeCategory) = op.(simples(C.C))

zero(C::OppositeCategory) = op(zero(C.C))

#-------------------------------------------------------------------------------
#   Inversion
#-------------------------------------------------------------------------------

OppositeCategory(C::OppositeCategory) = C.C
OppositeObject(X::OppositeObject) = X.X
OppositeMorphism(f::OppositeMorphism) = f.m

#=------------------------------------------------
    Checks
------------------------------------------------=#

issemisimple(C::OppositeCategory) = issemisimple(C.C)
isabelian(C::OppositeCategory) = isabelian(C.C)
islinear(C::OppositeCategory) = islinear(C.C)
ismonoidal(C::OppositeCategory) = ismonoidal(C.C)
isfinite(C::OppositeCategory) = isfinte(C.C)
istensor(C::OppositeCategory) = istensor(C.C)
ismultitensor(C::OppositeCategory) = ismultitensor(C.C)
isfusion(C::OppositeCategory) = isfusion(C.C)
ismultifusion(C::OppositeCategory) = ismultifusion(C.C)

#=------------------------------------------------
    Hom-Spaces
------------------------------------------------=#

function Hom(X::OppositeObject, Y::OppositeObject)
    opposite_basis = op.(basis(Hom(X.X,Y.X)))
    HomSpace(X,Y,opposite_basis, VectorSpaces(base_ring(X)))
end