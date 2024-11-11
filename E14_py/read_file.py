def read_file(filename):
    data = []
    with open(filename, 'r') as data_file:
        data_str = data_file.read()

    data_str = data_str.split('\n')
    for line in data_str:
        data.append(float(line))
    return data