module.exports = f => {
    for (const key in f.properties) {
        if (null === f.properties[key] || '所属未定地' === f.properties[key] || f.properties[key].match(/支庁$/)) {
            f.properties[key] = ''
        }
    }

    f.id = Number(f.properties.N03_007)
    const props = {
        prefecture: f.properties.N03_001,
        city: `${f.properties.N03_003}${f.properties.N03_004}`,
    }
    f.properties = props
    return f
}