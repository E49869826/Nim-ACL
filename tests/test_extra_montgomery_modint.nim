import atcoder/extra/math/modint_montgomery
import std/unittest

static:
#  assert StaticModInt[1].isModInt
#  assert StaticModInt[998244353].isModInt
#  assert modint.isModInt
#  assert not int.isModInt
#
#  assert StaticModInt[1].is_static_modint
#  assert StaticModInt[998244353].is_static_modint
#  assert modint998244353.is_static_modint
#  assert modint1000000007.is_static_modint
#  assert not modint.is_static_modint
#  assert not int.is_static_modint
#
#  assert not StaticModInt[1].is_dynamic_modint
#  assert not StaticModInt[998244353].is_dynamic_modint
#
#  assert modint.is_dynamic_modint
#  assert not int.is_dynamic_modint
#

  assert modint998244353.mod() == 998244353
  assert modint1000000007.mod() == 1000000007

test "ModintTest, ULL":
  let m1 = cast[uint](-1)
  type mint = modint998244353
  check 0 != (m1 + mint.init(1)).val()

#test "ModintTest, Mod1":
#  modint.set_mod(1)
#  for i in 0..<100:
#    for j in 0..<100:
#      check (modint.init(i) * modint.init(j)).val() == 0
#  check (modint.init(1234) + modint.init(5678)).val() == 0
#  check (modint.init(1234) - modint.init(5678)).val() == 0
#  check (modint.init(1234) * modint.init(5678)).val() == 0
#  check (modint.init(1234).pow(5678)) == 0
#  check 0 == modint.init(0).inv()
#
#  check 0 == modint.init(true.int).val()
#
#  type mint = StaticModInt[1]
#  for i in 0..<100:
#    for j in 0..<100:
#      check (mint(i) * mint(j)).val() == 0
#  check (mint.init(1234) + mint.init(5678)).val() == 0
#  check (mint.init(1234) - mint.init(5678)).val() == 0
#  check (mint.init(1234) * mint.init(5678)).val() == 0
#  check (mint.init(1234).pow(5678)) == 0
#  check 0 == modint(0).inv()
#
#  check 0 == mint.init(true.int).val()

##ifndef _MSC_VER
#
useMontgomery(modint11, 11)

test "ModintTest, Inv":
  for i in 1..<10:
    let x = modint11.init(i).inv().val()
    check 1 == (x * i) mod 11

  for i in 1 ..< 100000:
    let x = modint1000000007.init(i).inv().val()
    check 1 == (x * i) mod 1_000_000_007

test "ModintTest, ConstUsage":
  type sint = modint11
#  type sint = StaticModInt[11]
  const a = sint.init(9)
  check 9 == a.val()
#  type dint = modint
#  dint.set_mod(11)
#  let b = dint.init(9)
#  check 9 == b.val()

# TODO: inc, dec�͂������̂ł���
#test "ModintTest, Increment":
#  type sint = StaticModInt[11]
#  type dint = modint
#  dint.set_mod(11)
#
#  block:
#    var a = sint.init(8)
#    a.inc
#    check 9 == a.val()
#    a.inc
#    check 10 == a.val()
#    a.inc
#    check 0 == a.val()
#    a.inc
#    check 1 == a.val()
#    a = sint.init(3)
#    a.dec
#    check 2 == a.val()
#    a.dec
#    check 1 == a.val()
#    a.dec
#    check 0 == a.val()
#    a.dec
#    check 10 == a.val()
## TODO:
##    a = 8
##    check 8, (a++).val());
##    check 9, (a++).val());
##    check 10, (a++).val());
##    check 0, (a++).val());
##    check 1, a.val());
##    a = 3;
##    check 3, (a--).val());
##    check 2, (a--).val());
##    check 1, (a--).val());
##    check 0, (a--).val());
##    check 10, a.val());
#
#  block:
#    var a = dint.init(8)
#    a.inc
#    check 9 == a.val()
#    a.inc
#    check 10 == a.val()
#    a.inc
#    check 0 == a.val()
#    a.inc
#    check 1 == a.val()
#    a = dint.init(3)
#    a.dec
#    check 2 == a.val()
#    a.dec
#    check 1 == a.val()
#    a.dec
#    check 0 == a.val()
#    a.dec
#    check 10 == a.val()
## TODO:
##    a = 8;
##    check 8, (a++).val());
##    check 9, (a++).val());
##    check 10, (a++).val());
##    check 0, (a++).val());
##    check 1, a.val());
##    a = 3;
##    check 3, (a--).val());
##    check 2, (a--).val());
##    check 1, (a--).val());
##    check 0, (a--).val());
##    check 10, a.val());

# TODO: == ���Z�q�����H


test "ModintTest, StaticUsage":
  type mint = modint11
  check 11 == mint.mod()
# TODO: �v���X�������Ȃ��H
#  check 4 == + mint.init(4)
  check 7 == - mint(4)

#  ASSERT_FALSE(mint(1) == mint(3));
#  ASSERT_TRUE(mint(1) != mint(3));
#  ASSERT_TRUE(mint(1) == mint(12));
#  ASSERT_FALSE(mint(1) != mint(12));
  check mint(1) != mint(3)
  check mint(1) == mint(12)

  expect AssertionError:
    discard mint(3).pow(-1)

#
#  mint.set_mod(3)
#  check 3 == mint.mod()
#  check 1 == (mint.init(2) - mint.init(1)).val()
#  check 0 == (mint.init(1) + mint.init(2)).val()
#
#  mint.set_mod(11)
#  check 11 == mint.mod()
#  check 4 == (mint.init(3) * mint.init(5)).val()
#
#  # TODO: �v���X�������Ȃ��H
##  check 4 == +mint.init(4)
#  check 7 == -mint.init(4)
#
##  ASSERT_FALSE(mint(1) == mint(3));
##  ASSERT_TRUE(mint(1) != mint(3));
##  ASSERT_TRUE(mint(1) == mint(12));
##  ASSERT_FALSE(mint(1) != mint(12));
#  check mint.init(1) != mint.init(3)
#  check mint.init(1) == mint.init(12)
#
#  expect AssertionError:
#    discard mint.init(3).pow(-1)

#test "ModintTest, Constructor":
#  modint.set_mod(11)
#  check 1 == modint(true.int).val()
#  check 3 == modint((3.chr).int).val()
#  check 3 == modint.init((3).int8).val()
#  check 3 == modint.init((3).uint8).val()
#  check 3 == modint.init((3).int16).val()
#  check 3 == modint.init((3).uint16).val()
#  check 3 == modint.init((3).int32).val()
#  check 3 == modint.init((3).uint32).val()
#  check 3 == modint.init((3).int64).val()
#  check 3 == modint.init((3).uint64).val()
#  check 3 == modint.init((3).int).val()
#  check 3 == modint.init((3).uint).val()
#  check 1 == modint.init((-10).int8).val()
#  check 1 == modint.init((-10).int16).val()
#  check 1 == modint.init((-10).int32).val()
#  check 1 == modint.init((-10).int64).val()
#  check 1 == modint.init((-10).int).val()
#
#  check 2 == ((1).int32 + modint(1)).val()
#  check 2 == ((1).int16 + modint(1)).val()
#
#  var m:modint
#  check 0 == m.val()

test "ModintTest, ConstructorStatic":
  type mint = modint11

  check 1 == mint.init(true.int).val()
  check 3 == mint.init((3.chr).int).val()
  check 3 == mint.init((3).int8).val()
  check 3 == mint.init((3).uint8).val()
  check 3 == mint.init((3).int16).val()
  check 3 == mint.init((3).uint16).val()
  check 3 == mint.init((3).int32).val()
  check 3 == mint.init((3).uint32).val()
  check 3 == mint.init((3).int64).val()
  check 3 == mint.init((3).uint64).val()
  check 3 == mint.init((3).int).val()
  check 3 == mint.init((3).uint).val()
  check 1 == mint.init((-10).int8).val()
  check 1 == mint.init((-10).int16).val()
  check 1 == mint.init((-10).int32).val()
  check 1 == mint.init((-10).int64).val()
  check 1 == mint.init((-10).int).val()

  check 2 == ((1).int32 + mint(1)).val()
  check 2 == ((1).int16 + mint(1)).val()

  var m:mint
  check 0 == m.val()

