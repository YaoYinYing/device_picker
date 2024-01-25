import unittest
# from unittest.mock import patch, MagicMock
import platform

from device_picker import DevicePicker


class TestDevicePickerMacOS(unittest.TestCase):
    def setUp(self):
        self.device_picker = DevicePicker()
    
    def test_pytorch_device_macos(self):
        if platform.machine() == 'arm64':
            device = self.device_picker.pytorch_device()
            self.assertEqual(str(device), 'mps')
        else:
            device = self.device_picker.pytorch_device()
            self.assertEqual(str(device), 'cpu')
    def test_pytorch_device_macos_cpu(self):
        device = self.device_picker.pytorch_device('cpu')
        self.assertEqual(str(device), 'cpu')

    def test_tensorflow_device_macos(self):
        if platform.machine() == 'arm64':
            device = self.device_picker.tensorflow_device()
            self.assertEqual(str(device), 'GPU')
        else:
            device = self.device_picker.tensorflow_device()
            self.assertEqual(str(device), 'CPU')
    def test_tensorflow_device_macos_cpu(self):
        device = self.device_picker.tensorflow_device('CPU')
        self.assertEqual(str(device), 'CPU')


if __name__ == '__main__':
    unittest.main()
