# test_example.py
import unittest

# Exemple de fonction à tester (c'est juste pour illustrer, tu peux tester ce que tu veux)
def add(a, b):
    return a + b

class TestExample(unittest.TestCase):

    # Test d'addition simple
    def test_addition(self):
        self.assertEqual(add(1, 2), 3)

    # Test avec des nombres négatifs
    def test_addition_negative(self):
        self.assertEqual(add(-1, -1), -2)

    # Test d'addition avec zéro
    def test_addition_zero(self):
        self.assertEqual(add(0, 0), 0)

if __name__ == '__main__':
    unittest.main()
