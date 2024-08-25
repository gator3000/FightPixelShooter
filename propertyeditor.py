FILE = "server.properties"

def read(file:str=FILE) -> list:
    with open(file, "r") as f:
        return f.readlines()

def get_value(file:str=FILE, key:str="ressource-pack") -> tuple:
    env = read(file)
    i = 0
    for line in env:
        if line.startswith(key):
            return line.split("=")[-1][:-1], i
        i += 1
    return (False, -1.2)

def set_property(file:str=FILE, key:str="online-mode", value:str="true") -> None:
    env = read(file)
    _, iteration = get_value(file, key)
    del env[iteration]
    env.append(f"{key}={value}\n")
    propertiesfile = "".join(env)
    with open(file, "w") as f:
        f.write(propertiesfile)

class Basics:
    def __init__(self, file:str=FILE):
        self.file = file
    
    def print(self) -> None:
        for line in read(self.file):
            print(line)
    def printv(self, key:str="ressource-pack") -> None:
        print(f"{key} = {get_value(self.file, key)[0]}")
    
    def set_property(self, key:str, value:str) -> None:
        set_property(self.file, key, value)
    
    def switch(self, key:str):
        initial_value, _ = get_value(self.file, key)
        if initial_value == "true":
            set_property(self.file, key, "false")
        elif initial_value == "false":
            set_property(self.file, key, "true")
        else:
            print(initial_value)
            raise ValueError(f"ERROR1: You can't switch a non boolean property :\n{key}={initial_value}")
    
    def update_pack(self, rawlink:str):
        if rawlink.startswith("https://download.mc-packs.net/pack/"):
            sha1 = rawlink[35:-4]
            if len(sha1) == 40:
                set_property(self.file, "resource-pack", rawlink)
                set_property(self.file, "resource-pack-sha1", sha1)
            else:
                raise ValueError(f"ERROR3: This program can't detect the sha1 in this rawlink... Are you sure about that link ?\n{rawlink}\nFor help, I detect this : {sha1} of lenght of {len(sha1)} but it's not a sha1 string...")
        else:
            raise ValueError("ERROR2: The raw link of your pack is not supported by this program... Try https://mc-packs.net/ to set it !")

if __name__ == "__main__":
    cmd = ""
    while cmd != "$$$":
        cmd = input(">>> ")
        if cmd.startswith("$") and len("".join([x if x == "$" else "" for x in cmd])) == 3:
            sp = cmd.split("$")
            try:
                exec(f"Basics({sp[1]}).{sp[2]}")
            except ValueError as ve:
                print(ve)
        else:
            print(f"ERROR4: Your command '{cmd}' hasn't the good syntax: $file.name$function(args)$")