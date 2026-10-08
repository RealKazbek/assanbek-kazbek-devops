import os
import unittest
from unittest.mock import patch

from app.app import application_text, student_data


class StudentApplicationTests(unittest.TestCase):
    def test_default_student_data(self):
        with patch.dict(os.environ, {}, clear=True):
            self.assertEqual(student_data()["name"], "Kazbek")
            self.assertIn("Student ID: 37765", application_text())

    def test_environment_overrides_are_used(self):
        values = {
            "STUDENT_NAME": "Aruzhan",
            "STUDENT_SURNAME": "Test",
            "STUDENT_GROUP": "QA-1",
            "STUDENT_ID": "999",
        }
        with patch.dict(os.environ, values, clear=True):
            output = application_text()
            self.assertIn("Name: Aruzhan", output)
            self.assertIn("Student ID: 999", output)


if __name__ == "__main__":
    unittest.main()
