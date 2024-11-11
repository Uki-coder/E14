import numpy as np
import matplotlib.pyplot as plt
import read_file as rd
from scipy.optimize import curve_fit



def heat_func_model(x, a1, b1, c1, a2, b2, c2, a3, b3, c3, a4, b4, c4, a5, b5, c5):
    return a1*np.exp(-((x-b1)/c1)**2) + a2*np.exp(-((x-b2)/c2)**2) \
            + a3 * np.exp(-((x - b3) / c3) ** 2) + a4 * np.exp(-((x - b4) / c4) ** 2) \
            + a5 * np.exp(-((x - b5) / c5) ** 2)

def heat_func1(x, a1, b1, c1, a2, b2, c2, a3, b3, c3):
    return a1*np.exp(-((x-b1)/c1)**2) + a2*np.exp(-((x-b2)/c2)**2) + a3 * np.exp(-((x - b3) / c3) ** 2)

def gauss(x, a1, b1, c1):
    return a1*np.exp(-((x-b1)/c1)**2)


def freeze(x):
    return 15.2636590454653 * np.exp(-((158.848088553027 - x)/23.0268779422020)**2) \
            + 3.87715781070278 * np.exp(-((124.077689871176 - x)/11.7534951992239)**2) \
            + -0.880051688447133 * np.exp(-((144.928300144381 - x) / 7.19782540444138)**2) \
            + -1.94578588209376 * np.exp(-((157.115642489971 - x) / 9.61519950078256)**2) \
            + -11.2689882187589 * np.exp(-((163.847511441451 - x) / 17.9859193914458) ** 2)
temp = rd.read_file('T.txt')
temp_reduced = temp[11:61]
l_freeze = rd.read_file('Lfreze.txt')
freeze_reduced = l_freeze[11:61]
l_heat = rd.read_file('Lheat.txt')
heat_reduced = l_heat[11:61]


plt.scatter(temp, l_freeze, marker = '.', color = 'blue')
#plt.scatter(temp, l_heat, marker = '.', color = 'red')
plt.plot(np.array(temp_reduced), np.array(freeze(np.array(temp_reduced))))
plt.show()
