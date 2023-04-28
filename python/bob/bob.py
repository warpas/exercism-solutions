def response(hey_bob):
    if(shouting(hey_bob) and question(hey_bob)):
        return "Calm down, I know what I'm doing!"
    elif(silence(hey_bob)):
        return "Fine. Be that way!"
    elif(shouting(hey_bob)):
        return "Whoa, chill out!"
    elif(question(hey_bob)):
        return "Sure."

    return "Whatever."

def shouting(remark):
    return remark == str.upper(remark) and remark != str.lower(remark)

def question(remark):
    return remark.strip().endswith("?")

def silence(remark):
    return not remark.strip()
