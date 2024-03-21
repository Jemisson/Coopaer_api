import sys
import camelot
import json

def extract_data(file_path):
    tables = camelot.read_pdf(file_path, flavor='lattice')

    data_list = []

    for table in tables:
        if len(table.df) > 1:
            for index, row in table.df.iloc[2:-1].iterrows():
                name = row[0]

                valor_codificado = name
                valor_decodificado = row[0].encode('latin-1').decode('unicode-escape')

                event_parts = row[1].split('-')
                event = event_parts[0].strip()
                
                event_date_parts = event_parts[-1].strip().split(' ')
                if len(event_date_parts) == 1:
                    event_init_date = event_date_parts[0]
                    event_finish_date = event_date_parts[0]
                elif len(event_date_parts) == 2:
                    event_init_date = event_date_parts[0]
                    event_finish_date = event_date_parts[1]
                else:
                    event_init_date = ''
                    event_finish_date = ''

                amount = row[4]

                data_dict = {
                    "name": valor_decodificado,
                    "event": event,
                    "event_init_date": event_init_date,
                    "event_finish_date": event_finish_date,
                    "amount": amount
                }

                data_list.append(data_dict)

    json_data = json.dumps(data_list)

    return json_data

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <file_path>")
        sys.exit(1)

    file_path = sys.argv[1]
    json_data = extract_data(file_path)
    print(json_data)
